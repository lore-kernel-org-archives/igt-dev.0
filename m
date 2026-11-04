Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DB606A326
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 08:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E7310E578;
	Wed,  4 Nov 2026 08:12:35 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DB310E578;
 Wed,  4 Nov 2026 08:11:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6433208895409205047=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2Cv3=2C1/2=5D_tests/intel/xe=5Fexec=5Fthreads=3A_Parametris?=
 =?utf-8?q?e_worker_and_queue_counts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Nov 2026 08:11:41 -0000
Message-ID: <179377990153.115315.11102265570769410236@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============6433208895409205047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/intel/xe_exec_threads: Parametrise worker and queue counts
URL   : https://patchwork.freedesktop.org/series/177626/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9177_full -> IGTPW_16095_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16095_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16095_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16095_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@perf_pmu@rc6@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@perf_pmu@rc6@gt0.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:
    - shard-snb:          [DMESG-WARN][4] ([i915#17752]) -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_16095_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@execbuf-with-allocator:
    - shard-snb:          NOTRUN -> [SKIP][6] ([i915#17647])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@api_intel_allocator@execbuf-with-allocator.html

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - shard-snb:          NOTRUN -> [SKIP][7] ([i915#17667])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@api_intel_bb@blit-noreloc-purge-cache.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@api_intel_bb@crc32.html
    - shard-snb:          NOTRUN -> [SKIP][10] ([i915#17576])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@delta-check:
    - shard-snb:          NOTRUN -> [SKIP][11] ([i915#17645])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@api_intel_bb@delta-check.html

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - shard-snb:          NOTRUN -> [SKIP][12] ([i915#17641])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@api_intel_bb@object-noreloc-keep-cache-simple.html

  * igt@device_reset@cold-reset-bound:
    - shard-snb:          NOTRUN -> [SKIP][13] ([i915#17620]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@device_reset@cold-reset-bound.html
    - shard-glk:          NOTRUN -> [SKIP][14] ([i915#17537]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#17753])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_read@fault-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#17359])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@drm_read@fault-buffer.html

  * igt@fbdev@write:
    - shard-dg2:          [PASS][19] -> [SKIP][20] ([i915#2582])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@fbdev@write.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@fbdev@write.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-snb:          NOTRUN -> [SKIP][21] ([i915#17682])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_basic@multigpu-create-close:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#17499])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ccs@block-copy-uncompressed.html
    - shard-glk:          NOTRUN -> [SKIP][24] ([i915#17499])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-glk11:        NOTRUN -> [SKIP][25] ([i915#17499])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][26] ([i915#13356] / [i915#16348])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-glk:          NOTRUN -> [SKIP][27] ([i915#17568])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_close_race@multigpu-basic-threads.html
    - shard-snb:          NOTRUN -> [SKIP][28] ([i915#17568])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][30] ([i915#17552])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_compute@compute-square.html
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#17552])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk11:        NOTRUN -> [SKIP][32] ([i915#17530])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][33] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_param@get-priority-new-ctx:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#17646])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@gem_ctx_param@get-priority-new-ctx.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk11:        NOTRUN -> [SKIP][35] ([i915#17535])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk11:        NOTRUN -> [SKIP][36] ([i915#17527]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - shard-glk:          NOTRUN -> [SKIP][39] ([i915#17527])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#1099]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile:
    - shard-snb:          NOTRUN -> [SKIP][41] ([i915#17621]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ctx_persistence@saturated-hostile.html

  * igt@gem_ctx_shared@q-promotion:
    - shard-snb:          NOTRUN -> [SKIP][42] ([i915#17342]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@gem_ctx_shared@q-promotion.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@gem_ctx_sseu@engines.html
    - shard-glk10:        NOTRUN -> [SKIP][44] ([i915#17496])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@gem_ctx_sseu@invalid-args.html
    - shard-glk:          NOTRUN -> [SKIP][46] ([i915#17496])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][47] -> [INCOMPLETE][48] ([i915#13390] / [i915#17327])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][49] ([i915#13356] / [i915#13390])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][50] ([i915#8898]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4771]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@fairslice:
    - shard-glk11:        NOTRUN -> [SKIP][52] ([i915#17547])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel:
    - shard-snb:          NOTRUN -> [SKIP][53] ([i915#17587]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4525])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-glk:          NOTRUN -> [SKIP][55] ([i915#17547]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fence@parallel:
    - shard-snb:          NOTRUN -> [SKIP][56] ([i915#17599]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_exec_fence@parallel.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@invalid-bsd2-flag-on-vebox:
    - shard-snb:          NOTRUN -> [SKIP][59] ([i915#17659])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_exec_params@invalid-bsd2-flag-on-vebox.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-snb:          NOTRUN -> [SKIP][60] ([i915#17662])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#17416])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#17523]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_exec_params@secure-non-root.html
    - shard-snb:          NOTRUN -> [SKIP][63] ([i915#17523])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3281]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#3281]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3281]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3281]) +8 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#14544] / [i915#3281])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-snb:          NOTRUN -> [SKIP][69] ([i915#17590]) +14 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_exec_schedule@preemptive-hang.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4537] / [i915#4812])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][71] -> [INCOMPLETE][72] ([i915#13356]) +1 other test incomplete
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html
    - shard-rkl:          [PASS][73] -> [INCOMPLETE][74] ([i915#13356]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@gem_exec_suspend@basic-s0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][75] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-snb:          NOTRUN -> [SKIP][76] ([i915#17628]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_exercise_blt@fast-copy-emit:
    - shard-snb:          NOTRUN -> [SKIP][77] ([i915#17622])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_exercise_blt@fast-copy-emit.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4860]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4860])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#2190])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4613])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4565]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-snb:          NOTRUN -> [SKIP][83] ([i915#17503]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#12193]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][85] ([i915#17503] / [i915#4613]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#4613]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4613]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-glk:          NOTRUN -> [SKIP][88] ([i915#17543])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-glk:          NOTRUN -> [SKIP][89] ([i915#17572])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4077]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4077]) +9 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4083]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3282]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-snb:          NOTRUN -> [SKIP][94] ([i915#17635])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_ppgtt@shrink-vs-evict-any:
    - shard-snb:          NOTRUN -> [SKIP][95] ([i915#17615])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ppgtt@shrink-vs-evict-any.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3282]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#14544] / [i915#3282])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-glk10:        NOTRUN -> [SKIP][98] ([i915#17521])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#13717])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4270]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-glk:          NOTRUN -> [SKIP][101] ([i915#17521]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-snb:          NOTRUN -> [SKIP][102] ([i915#17521]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4270])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3282]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][105] ([i915#17492])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][106] ([i915#17591]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-snb:          NOTRUN -> [SKIP][107] ([i915#17492]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-glk:          NOTRUN -> [SKIP][108] ([i915#17492]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#8428])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#5190] / [i915#8428]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4079])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-glk:          NOTRUN -> [SKIP][112] ([i915#17551]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][113] ([i915#17471]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4885])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#17430])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][116] ([i915#13356] / [i915#13809] / [i915#16193])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@gem_softpin@noreloc-s3.html
    - shard-tglu:         [PASS][117] -> [ABORT][118] ([i915#15840]) +1 other test abort
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-2/igt@gem_softpin@noreloc-s3.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#17433] / [i915#3297])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3297])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-glk:          NOTRUN -> [SKIP][121] ([i915#17507])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3282] / [i915#3297])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#3297]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#3297] / [i915#4880])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3297] / [i915#4880])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-snb:          NOTRUN -> [SKIP][126] ([i915#17507]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#3297])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-glk10:        NOTRUN -> [SKIP][128] ([i915#17507])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-glk11:        NOTRUN -> [SKIP][129] ([i915#17507])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#3297])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_vm_create@create-ext:
    - shard-snb:          NOTRUN -> [SKIP][131] ([i915#17596]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_vm_create@create-ext.html

  * igt@gem_watchdog@default-virtual:
    - shard-snb:          NOTRUN -> [SKIP][132] ([i915#17654])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_watchdog@default-virtual.html

  * igt@gen3_mixed_blits:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#17455]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#17455]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@gen3_render_linear_blits.html
    - shard-glk:          NOTRUN -> [SKIP][135] ([i915#17555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk11:        NOTRUN -> [SKIP][136] ([i915#17511])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gen3_render_tiledx_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk:          NOTRUN -> [SKIP][137] ([i915#17578])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#17455]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk:          NOTRUN -> [SKIP][139] ([i915#17505]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@gen7_exec_parse@bitmasks.html
    - shard-snb:          NOTRUN -> [SKIP][140] ([i915#17505]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#17455]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][142] -> [ABORT][143] ([i915#5566])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk3/igt@gen9_exec_parse@allowed-all.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk11:        NOTRUN -> [ABORT][144] ([i915#5566])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][145] ([i915#17597]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#2856]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#2856]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#2527]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#2527] / [i915#2856]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-glk:          NOTRUN -> [SKIP][150] ([i915#17514])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@gpu_buddy@gpu_buddy.html
    - shard-snb:          NOTRUN -> [SKIP][151] ([i915#17514])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#14123])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#11527]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@i915_drm_fdinfo@busy-check-all.html
    - shard-snb:          NOTRUN -> [SKIP][154] ([i915#17603]) +8 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#14118])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#13786])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][157] ([i915#17580])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][158] ([i915#17610])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#15479]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][160] ([i915#15342]) +1 other test abort
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7178])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-glk:          NOTRUN -> [SKIP][162] ([i915#17526]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#8399])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-snb:          NOTRUN -> [SKIP][164] ([i915#17541])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-glk:          NOTRUN -> [SKIP][165] ([i915#17541])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-mtlp:         [PASS][166] -> [WARN][167] ([i915#13790]) +1 other test warn
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-idle.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#17434] / [i915#17450])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#17434] / [i915#17450])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#11681] / [i915#6621]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#11681])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [PASS][172] -> [FAIL][173] ([i915#15365])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-8/igt@i915_pm_rps@waitboost.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#7984])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-snb:          NOTRUN -> [SKIP][175] ([i915#17584])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6245])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-unsupported:
    - shard-glk:          NOTRUN -> [SKIP][177] ([i915#17563])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@i915_query@query-topology-unsupported.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#16079])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-glk:          NOTRUN -> [SKIP][179] ([i915#17673])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         [PASS][180] -> [FAIL][181] ([i915#17170] / [i915#17171])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@i915_suspend@debugfs-reader.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][182] ([i915#13356] / [i915#16182] / [i915#4817])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#7707])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#4212]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-snb:          NOTRUN -> [SKIP][185] ([i915#17469])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#4212])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-glk:          NOTRUN -> [SKIP][187] ([i915#17668])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#12454] / [i915#12712])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-snb:          NOTRUN -> [SKIP][189] ([i915#17668])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][190] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][191] ([i915#17752]) +1 other test dmesg-warn
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-glk:          NOTRUN -> [SKIP][192] ([i915#17562])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
    - shard-snb:          NOTRUN -> [SKIP][193] ([i915#17562])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#1769] / [i915#3555])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-glk11:        NOTRUN -> [SKIP][195] ([i915#17478]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#4538] / [i915#5286]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][197] ([i915#17478]) +11 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#4538] / [i915#5286]) +7 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
    - shard-snb:          NOTRUN -> [SKIP][199] ([i915#17478]) +22 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#5286])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#17432] / [i915#5286]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][202] -> [FAIL][203] ([i915#15733] / [i915#5138])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-snb:          NOTRUN -> [SKIP][204] ([i915#17500]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#3638]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> [SKIP][206] ([i915#17524])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3828])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][208] ([i915#17524])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][209] -> [SKIP][210] ([i915#17356]) +45 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][211] ([i915#17500])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#17431]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#17431] / [i915#3638])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#17431]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#17431]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-glk11:        NOTRUN -> [SKIP][216] ([i915#17500]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-snb:          NOTRUN -> [SKIP][217] ([i915#17544])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#4538] / [i915#5190]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#4538]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#17432])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-snb:          NOTRUN -> [SKIP][221] ([i915#17557]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#17432]) +7 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][223] ([i915#17500]) +8 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#4538]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][225] -> [DMESG-WARN][226] ([i915#13363])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
    - shard-tglu:         [PASS][227] -> [DMESG-WARN][228] ([i915#13363])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-tglu:         [PASS][229] -> [DMESG-WARN][230] ([i915#17147])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
    - shard-rkl:          [PASS][231] -> [DMESG-WARN][232] ([i915#17147])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#12313])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][234] ([i915#17490] / [i915#17491]) +9 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][235] ([i915#17491]) +28 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#6095]) +132 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#6095]) +69 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][238] ([i915#17594]) +28 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#6095]) +19 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][240] ([i915#17525])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#6095]) +63 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#12805])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][244] ([i915#17490] / [i915#17491]) +43 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][245] ([i915#17525])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][246] ([i915#17158])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         [PASS][247] -> [FAIL][248] ([i915#17158])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         [PASS][249] -> [INCOMPLETE][250] ([i915#15582])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][251] ([i915#13356] / [i915#14694] / [i915#15582]) +2 other tests incomplete
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][253] -> [INCOMPLETE][254] ([i915#14694] / [i915#15582])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][255] ([i915#14694] / [i915#15582])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#6095]) +15 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#14098] / [i915#6095]) +40 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#14544] / [i915#6095]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#10307] / [i915#6095]) +88 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#12313])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][261] ([i915#17491]) +121 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#3742])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-glk:          NOTRUN -> [SKIP][263] ([i915#17550])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#16017])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#11151] / [i915#7828]) +9 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][266] ([i915#17489]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_chamelium_color@ctm-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#17427])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#17427])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-snb:          NOTRUN -> [SKIP][269] ([i915#17489]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#17427])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#17427]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
    - shard-glk11:        NOTRUN -> [SKIP][272] ([i915#17497]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][273] ([i915#17497]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#17427]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][275] ([i915#17497])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#16471] / [i915#17427]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][277] ([i915#17497]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#16471] / [i915#17427])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#16464] / [i915#16471] / [i915#17427])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#16471] / [i915#17427]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#16471] / [i915#17427]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#11151] / [i915#7828]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#11151] / [i915#7828]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#11151])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-glk11:        NOTRUN -> [SKIP][285] ([i915#17483])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][286] ([i915#17483]) +12 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][287] ([i915#17483]) +12 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#11151] / [i915#7828]) +8 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#11151] / [i915#7828]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@gamma:
    - shard-dg2:          [PASS][290] -> [SKIP][291] ([i915#12655] / [i915#17373]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_color@gamma.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_color@gamma.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-snb:          NOTRUN -> [SKIP][292] ([i915#17656]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][293] ([i915#17657])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_color@invalid-degamma-lut-sizes@pipe-a.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-snb:          NOTRUN -> [SKIP][294] ([i915#17510]) +6 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#16990]) +7 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][296] ([i915#17510])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][297] ([i915#17510]) +6 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          [PASS][298] -> [SKIP][299] ([i915#15529]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#16990]) +15 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#16990]) +11 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-glk:          NOTRUN -> [SKIP][302] ([i915#17508]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#15865]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#15865])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-snb:          NOTRUN -> [SKIP][306] ([i915#17502]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][307] ([i915#17502]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_content_protection@dp-mst-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#15330] / [i915#3116])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#15330])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#15865])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-glk11:        NOTRUN -> [SKIP][311] ([i915#17508])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-snb:          NOTRUN -> [SKIP][312] ([i915#17508]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#15865])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#13049] / [i915#3359])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-glk:          NOTRUN -> [SKIP][315] ([i915#17533]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#13049]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][317] ([i915#13566]) +1 other test fail
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#14544] / [i915#3555])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#3555]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-glk11:        NOTRUN -> [SKIP][320] ([i915#17504])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#3555]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][322] ([i915#13566]) +3 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#3555]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-snb:          NOTRUN -> [SKIP][324] ([i915#17533]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][325] ([i915#17504]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#3555] / [i915#8814])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-snb:          NOTRUN -> [SKIP][327] ([i915#17504]) +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-glk11:        NOTRUN -> [SKIP][328] ([i915#17533])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [PASS][329] -> [FAIL][330] ([i915#17157]) +1 other test fail
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@kms_cursor_crc@cursor-suspend.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#17428] / [i915#9809])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#11190] / [i915#17356])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-glk11:        NOTRUN -> [SKIP][333] ([i915#17457])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#17428] / [i915#17454]) +5 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][336] ([i915#15804])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-glk:          NOTRUN -> [SKIP][337] ([i915#17549])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#9067])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#17356]) +5 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [SKIP][340] ([i915#17457])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#4103])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#9833])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#13691])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-snb:          NOTRUN -> [SKIP][344] ([i915#17486]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][345] ([i915#17487])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][346] ([i915#17486]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-glk:          NOTRUN -> [SKIP][347] ([i915#17560])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-snb:          NOTRUN -> [SKIP][348] ([i915#17560])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#17289])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-glk11:        NOTRUN -> [SKIP][350] ([i915#17519])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-snb:          NOTRUN -> [SKIP][351] ([i915#17616])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#17291])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
    - shard-glk:          NOTRUN -> [SKIP][353] ([i915#17616])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][354] ([i915#17506])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#17286])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#17506])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#17290])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#17290])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#13748]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#17285])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#17285]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][362] ([i915#17477]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][363] ([i915#17477]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#16867])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-snb:          NOTRUN -> [SKIP][365] ([i915#17680])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#13707])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#13707])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-glk:          NOTRUN -> [SKIP][368] ([i915#17680])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk:          NOTRUN -> [SKIP][369] ([i915#17548])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#16361]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-glk:          NOTRUN -> [SKIP][371] ([i915#17458]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-snb:          NOTRUN -> [SKIP][372] ([i915#17458]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_dsc@dsc-with-output-formats.html
    - shard-glk11:        NOTRUN -> [SKIP][373] ([i915#17458]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#16361]) +4 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#16361]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [PASS][376] -> [SKIP][377] ([i915#1849])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_fbcon_fbt@fbc.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-snb:          NOTRUN -> [SKIP][378] ([i915#17516])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_fbcon_fbt@psr.html
    - shard-glk:          NOTRUN -> [SKIP][379] ([i915#17516])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#16680])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-mtlp:         [PASS][381] -> [FAIL][382] ([i915#17189] / [i915#17349])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-snb:          NOTRUN -> [SKIP][383] ([i915#17581])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_feature_discovery@chamelium.html
    - shard-glk11:        NOTRUN -> [SKIP][384] ([i915#17581])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#16081])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@hdr:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#16600])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#658])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_feature_discovery@psr2.html
    - shard-glk:          NOTRUN -> [SKIP][388] ([i915#17585])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-glk:          NOTRUN -> [SKIP][389] ([i915#17539])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_feature_discovery@vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#16600])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][391] ([i915#3637] / [i915#9934]) +10 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#8381]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#3637] / [i915#9934]) +4 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][394] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][395] ([i915#12745] / [i915#13356] / [i915#17183])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][396] ([i915#9934])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#9934]) +4 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#9934]) +5 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-mtlp:         [PASS][399] -> [FAIL][400] ([i915#13027]) +1 other test fail
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [FAIL][401] ([i915#17214]) +1 other test fail
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-mtlp:         [PASS][402] -> [INCOMPLETE][403] ([i915#16472] / [i915#6113]) +1 other test incomplete
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][404] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-snb:          NOTRUN -> [ABORT][405] ([i915#15840]) +8 other tests abort
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-dg2:          [PASS][406] -> [SKIP][407] ([i915#5354]) +6 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#5354])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2:          [PASS][409] -> [SKIP][410] ([i915#3555] / [i915#8813]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][411] ([i915#17522]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][412] ([i915#17493])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#15643]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][414] ([i915#17493])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-snb:          NOTRUN -> [SKIP][415] ([i915#17593]) +11 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#3555] / [i915#8813])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#14544] / [i915#15643])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][418] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][419] ([i915#17522]) +11 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][420] ([i915#17522]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][421] ([i915#17484]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#15643]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#15643]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          [PASS][424] -> [SKIP][425] ([i915#16708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][426] ([i915#15104] / [i915#15990]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][427] -> [SKIP][428] ([i915#16708] / [i915#5354]) +7 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][429] ([i915#15990] / [i915#8708]) +15 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][430] ([i915#10056] / [i915#13356] / [i915#16593])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][431] ([i915#17559]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][432] ([i915#17559]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][433] ([i915#15989]) +21 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][434] ([i915#16708]) +6 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][435] -> [SKIP][436] ([i915#17517])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][437] ([i915#17428]) +58 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][438] ([i915#15990]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][439] ([i915#16708] / [i915#5354]) +4 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#15104] / [i915#15990])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][441] ([i915#17588]) +138 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][442] ([i915#15102]) +11 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#14544] / [i915#17428] / [i915#1825])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][444] ([i915#15991] / [i915#17428] / [i915#1825]) +11 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#14544] / [i915#17428]) +9 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][446] ([i915#17482]) +172 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][447] ([i915#17482]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][448] ([i915#5439])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][449] ([i915#14544] / [i915#15102]) +3 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][450] ([i915#15102]) +41 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][451] ([i915#15102]) +42 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][452] ([i915#15990]) +27 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][453] ([i915#15991] / [i915#17428]) +13 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#17428]) +62 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][455] ([i915#15990]) +7 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][456] ([i915#17482]) +28 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][457] ([i915#5439])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [PASS][458] -> [SKIP][459] ([i915#15989]) +3 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#15989]) +5 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][461] ([i915#17517]) +31 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-dg1:          NOTRUN -> [SKIP][462] ([i915#17428]) +76 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][463] ([i915#17517]) +75 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][464] ([i915#15989]) +17 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][465] ([i915#15989]) +13 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][466] ([i915#13356] / [i915#16056] / [i915#16593])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-snb:          NOTRUN -> [SKIP][467] ([i915#17534] / [i915#17588]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-glk:          NOTRUN -> [SKIP][468] ([i915#17534])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][469] ([i915#15102]) +20 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][470] ([i915#15990] / [i915#8708]) +3 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][471] ([i915#17428] / [i915#1825]) +3 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][472] ([i915#15991] / [i915#5354]) +8 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][473] ([i915#15990] / [i915#8708]) +2 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][474] ([i915#17606])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][475] ([i915#15991]) +6 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][476] ([i915#17482]) +63 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][477] ([i915#15989]) +12 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html

  * igt@kms_getfb@getfb2-accept-nv12:
    - shard-snb:          NOTRUN -> [SKIP][478] ([i915#17658])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_getfb@getfb2-accept-nv12.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-dg2:          NOTRUN -> [ABORT][479] ([i915#15132])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-glk:          NOTRUN -> [INCOMPLETE][480] ([i915#13356])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-snb:          NOTRUN -> [SKIP][481] ([i915#17681])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][482] ([i915#3555] / [i915#8228]) +3 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-glk11:        NOTRUN -> [SKIP][483] ([i915#17498])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-snb:          NOTRUN -> [SKIP][484] ([i915#17498]) +2 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][485] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms.html
    - shard-glk:          NOTRUN -> [SKIP][486] ([i915#17498]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][487] ([i915#16518] / [i915#3555] / [i915#8228])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][488] ([i915#3555] / [i915#8228])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][489] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-dg2:          [PASS][490] -> [SKIP][491] ([i915#16746] / [i915#3555]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_invalid_mode@zero-clock.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][492] ([i915#17512])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][493] ([i915#17678])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_joiner@basic-force-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][494] ([i915#17678])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][495] ([i915#15458])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-glk:          NOTRUN -> [SKIP][496] ([i915#17575])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_joiner@basic-max-non-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][497] ([i915#17575])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-snb:          NOTRUN -> [SKIP][498] ([i915#17512])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][499] ([i915#15459])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-snb:          NOTRUN -> [SKIP][500] ([i915#17567])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][501] ([i915#15458])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][502] ([i915#17617])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][503] ([i915#17617])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][504] ([i915#15638] / [i915#15722])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-tglu:         NOTRUN -> [SKIP][505] ([i915#16451])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][506] ([i915#15815])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][507] ([i915#6301])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][508] ([i915#17455]) +4 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][509] ([i915#17540])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-rkl:          NOTRUN -> [SKIP][510] ([i915#14544] / [i915#17455])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-snb:          NOTRUN -> [SKIP][511] ([i915#17540])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-dg2:          [PASS][512] -> [SKIP][513] ([i915#11190] / [i915#17356])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][514] ([i915#14712])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][515] ([i915#118] / [i915#16396])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-rkl:          NOTRUN -> [SKIP][516] ([i915#14712])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][517] ([i915#15709]) +2 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][518] ([i915#15709]) +1 other test skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
    - shard-rkl:          NOTRUN -> [SKIP][519] ([i915#15709]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-dg2:          [PASS][520] -> [SKIP][521] ([i915#8825]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][522] ([i915#17479]) +2 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][523] ([i915#16386]) +3 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][524] ([i915#15709]) +2 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][525] ([i915#17494]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][526] ([i915#15709]) +2 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][527] ([i915#17479]) +8 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][528] ([i915#16386]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-snb:          NOTRUN -> [SKIP][529] ([i915#17479]) +8 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][530] ([i915#16112])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][531] ([i915#10647] / [i915#12177])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][532] ([i915#10647]) +1 other test fail
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-snb:          NOTRUN -> [SKIP][533] ([i915#17595]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-snb:          NOTRUN -> [SKIP][534] ([i915#17509])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          NOTRUN -> [SKIP][535] ([i915#13958])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu:         NOTRUN -> [SKIP][536] ([i915#13958])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][537] ([i915#13958])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][538] ([i915#17542])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_plane_multiple@tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][539] ([i915#14259])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][540] ([i915#14259]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_plane_multiple@tiling-yf.html
    - shard-snb:          NOTRUN -> [SKIP][541] ([i915#17542])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][542] ([i915#6953] / [i915#9423])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-snb:          NOTRUN -> [SKIP][543] ([i915#17626])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][544] ([i915#17528]) +8 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][545] ([i915#15329]) +12 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2:          [PASS][546] -> [SKIP][547] ([i915#15329] / [i915#17356] / [i915#9423]) +3 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg2:          [PASS][548] -> [SKIP][549] ([i915#15329] / [i915#17356]) +5 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu:         NOTRUN -> [SKIP][550] ([i915#15329]) +4 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][551] ([i915#17528] / [i915#17529]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][552] ([i915#17529]) +3 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][553] -> [SKIP][554] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][555] ([i915#17528]) +3 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][556] ([i915#15329]) +3 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - shard-snb:          NOTRUN -> [SKIP][557] ([i915#17529]) +5 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-glk11:        NOTRUN -> [SKIP][558] ([i915#17529]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-glk11:        NOTRUN -> [SKIP][559] ([i915#17528]) +1 other test skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][560] ([i915#15329] / [i915#6953])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][561] ([i915#15329] / [i915#17356] / [i915#9423])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][562] ([i915#15329]) +2 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][563] ([i915#15329] / [i915#17356])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][564] ([i915#15329] / [i915#3555] / [i915#6953])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [PASS][565] -> [SKIP][566] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [PASS][567] -> [SKIP][568] ([i915#15329]) +17 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> [SKIP][569] ([i915#17462])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][570] ([i915#12343] / [i915#5354])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][571] ([i915#17462])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-snb:          NOTRUN -> [SKIP][572] ([i915#17462]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][573] ([i915#12343] / [i915#5354])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][574] ([i915#12343] / [i915#5354]) +1 other test skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][575] ([i915#13356] / [i915#16938])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-glk:          NOTRUN -> [SKIP][576] ([i915#17495]) +1 other test skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][577] ([i915#15948])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_pm_dc@dc6-psr.html
    - shard-snb:          NOTRUN -> [SKIP][578] ([i915#17602]) +2 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][579] ([i915#15948]) +1 other test skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk:          NOTRUN -> [SKIP][580] ([i915#17573])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][581] ([i915#8430])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html
    - shard-snb:          NOTRUN -> [SKIP][582] ([i915#17633])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-snb:          NOTRUN -> [SKIP][583] ([i915#17473]) +9 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-glk11:        NOTRUN -> [SKIP][584] ([i915#15073])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [PASS][585] -> [SKIP][586] ([i915#15073])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][587] ([i915#15073])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-mtlp:         NOTRUN -> [SKIP][588] ([i915#4077]) +3 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][589] -> [SKIP][590] ([i915#15073]) +2 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][591] -> [SKIP][592] ([i915#15073])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][593] ([i915#15073])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu:         NOTRUN -> [SKIP][594] ([i915#15073])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-glk:          NOTRUN -> [SKIP][595] ([i915#17710])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_pm_rpm@pc8-residency.html
    - shard-mtlp:         NOTRUN -> [SKIP][596] ([i915#17450])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][597] ([i915#14419])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [PASS][598] -> [SKIP][599] ([i915#17446] / [i915#3547])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][600] ([i915#14544] / [i915#6524])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-snb:          NOTRUN -> [SKIP][601] ([i915#17569]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-glk:          NOTRUN -> [SKIP][602] ([i915#17569]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][603] ([i915#11520]) +7 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][604] ([i915#11520]) +12 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][605] ([i915#11520]) +13 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][606] ([i915#9808])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][607] ([i915#12316]) +3 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][608] ([i915#11520]) +3 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][609] ([i915#11520] / [i915#14544]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][610] ([i915#11520]) +2 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-glk10:        NOTRUN -> [SKIP][611] ([i915#11520])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-rkl:          NOTRUN -> [SKIP][612] ([i915#11520]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][613] ([i915#11520]) +11 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][614] ([i915#9683])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][615] ([i915#9683])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][616] ([i915#9683])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-snb:          NOTRUN -> [SKIP][617] ([i915#17546])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk11:        NOTRUN -> [SKIP][618] ([i915#17546])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][619] ([i915#17480]) +36 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_psr@fbc-pr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][620] ([i915#9688]) +5 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][621] ([i915#9732]) +18 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-glk11:        NOTRUN -> [SKIP][622] ([i915#17480]) +3 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][623] ([i915#1072] / [i915#9732]) +5 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][624] ([i915#1072] / [i915#9732]) +12 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][625] ([i915#17480] / [i915#9732])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][626] ([i915#17480]) +30 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][627] ([i915#1072] / [i915#9732]) +22 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][628] ([i915#15949])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][629] ([i915#15949])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][630] ([i915#17488]) +4 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-snb:          NOTRUN -> [SKIP][631] ([i915#17676])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][632] ([i915#4884])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][633] ([i915#15500] / [i915#16184])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][634] ([i915#5289])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][635] ([i915#15867]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][636] ([i915#5190])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][637] ([i915#17488]) +4 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][638] ([i915#17432] / [i915#5289])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-snb:          NOTRUN -> [SKIP][639] ([i915#17501])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][640] ([i915#13179]) +1 other test abort
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][641] ([i915#13179]) +1 other test abort
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk:          NOTRUN -> [SKIP][642] ([i915#17463])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-snb:          NOTRUN -> [SKIP][643] ([i915#17604])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][644] ([i915#3555] / [i915#8809] / [i915#8823])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][645] ([i915#3555]) +3 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][646] ([i915#14544] / [i915#8623])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-snb:          NOTRUN -> [SKIP][647] ([i915#17672])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][648] ([i915#17445])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][649] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][650] ([i915#17520]) +2 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][651] ([i915#15243] / [i915#3555])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-snb:          NOTRUN -> [SKIP][652] ([i915#17520]) +2 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-glk:          NOTRUN -> [SKIP][653] ([i915#17561])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_vrr@lobf.html
    - shard-snb:          NOTRUN -> [SKIP][654] ([i915#17561])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][655] ([i915#11920])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-glk11:        NOTRUN -> [SKIP][656] ([i915#17520]) +1 other test skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][657] ([i915#9906])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][658] ([i915#9906])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-glk:          NOTRUN -> [SKIP][659] ([i915#17536]) +1 other test skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][660] ([i915#2434])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@perf@mi-rpc.html
    - shard-snb:          NOTRUN -> [SKIP][661] ([i915#17592]) +8 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-glk11:        NOTRUN -> [SKIP][662] ([i915#17704])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-mtlp:         [PASS][663] -> [FAIL][664] ([i915#4349])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs0.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@event-wait:
    - shard-glk:          NOTRUN -> [SKIP][665] ([i915#17698]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk9/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          NOTRUN -> [SKIP][666] ([i915#17416]) +1 other test skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         [PASS][667] -> [FAIL][668] ([i915#17245])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@perf_pmu@rc6-suspend.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][669] ([i915#8516])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][670] ([i915#17683]) +1 other test skip
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@perf_pmu@semaphore-busy@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][671] ([i915#17637]) +3 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb4/igt@perf_pmu@semaphore-busy@vcs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][672] ([i915#3708] / [i915#4077])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@coherency-gtt:
    - shard-glk:          NOTRUN -> [SKIP][673] ([i915#17467]) +1 other test skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk6/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk11:        NOTRUN -> [SKIP][674] ([i915#17467])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk11/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-snb:          NOTRUN -> [SKIP][675] ([i915#17467])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb5/igt@prime_vgem@fence-read-hang.html
    - shard-tglu:         NOTRUN -> [SKIP][676] ([i915#17448])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@prime_vgem@fence-read-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][677] ([i915#3708])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_timeslice_duration@idempotent@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][678] ([i915#17632]) +11 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-snb7/igt@sysfs_timeslice_duration@idempotent@vcs0.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-wakeup:
    - shard-dg2:          [SKIP][679] ([i915#17359]) -> [PASS][680]
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@drm_read@short-buffer-wakeup.html

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][681] ([i915#2582]) -> [PASS][682]
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@fbdev@eof.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@fbdev@eof.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][683] ([i915#13356] / [i915#16348]) -> [PASS][684]
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         [INCOMPLETE][685] ([i915#17190] / [i915#7975]) -> [PASS][686]
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@gem_eio@hibernate.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [INCOMPLETE][687] ([i915#17190]) -> [PASS][688]
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress@render:
    - shard-mtlp:         [ABORT][689] ([i915#15511]) -> [PASS][690] +1 other test pass
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-2/igt@gem_eio@unwedge-stress@render.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@gem_eio@unwedge-stress@render.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][691] ([i915#4270]) -> [PASS][692] +1 other test pass
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [INCOMPLETE][693] ([i915#13356]) -> [PASS][694] +1 other test pass
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_workarounds@suspend-resume.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][695] ([i915#7984]) -> [PASS][696]
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-6/igt@i915_power@sanity.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@i915_power@sanity.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [INCOMPLETE][697] ([i915#4817]) -> [PASS][698] +1 other test pass
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-mtlp:         [INCOMPLETE][699] ([i915#17037]) -> [PASS][700] +1 other test pass
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][701] ([i915#17150]) -> [PASS][702]
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2:          [SKIP][703] ([i915#17356]) -> [PASS][704] +41 other tests pass
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_atomic_interruptible@atomic-setmode.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-rkl:          [FAIL][705] ([i915#15662]) -> [PASS][706]
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          [INCOMPLETE][707] ([i915#13356]) -> [PASS][708] +1 other test pass
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][709] ([i915#15582]) -> [PASS][710]
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-mtlp:         [ABORT][711] ([i915#17345]) -> [PASS][712] +1 other test pass
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][713] ([i915#17158]) -> [PASS][714]
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][715] ([i915#13356] / [i915#15582]) -> [PASS][716]
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_color@degamma:
    - shard-dg2:          [SKIP][717] ([i915#12655] / [i915#17373]) -> [PASS][718] +1 other test pass
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_color@degamma.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_color@degamma.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-dg2:          [SKIP][719] ([i915#15529]) -> [PASS][720] +1 other test pass
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][721] ([i915#13566]) -> [PASS][722] +2 other tests pass
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][723] ([i915#13566]) -> [PASS][724] +1 other test pass
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglu:         [ABORT][725] ([i915#15840]) -> [PASS][726] +1 other test pass
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][727] ([i915#5354]) -> [PASS][728] +6 other tests pass
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [SKIP][729] ([i915#3555] / [i915#8813]) -> [PASS][730] +2 other tests pass
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][731] ([i915#16708]) -> [PASS][732]
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          [SKIP][733] ([i915#16708] / [i915#5354]) -> [PASS][734] +3 other tests pass
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [SKIP][735] ([i915#17517]) -> [PASS][736] +6 other tests pass
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-render.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][737] ([i915#15989]) -> [PASS][738] +4 other tests pass
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-dg2:          [SKIP][739] ([i915#17357]) -> [PASS][740]
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-mtlp:         [INCOMPLETE][741] ([i915#17319]) -> [PASS][742] +1 other test pass
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-4/igt@kms_hdr@bpc-switch-suspend.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-dg2:          [SKIP][743] ([i915#16746] / [i915#3555]) -> [PASS][744] +1 other test pass
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-start.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          [SKIP][745] ([i915#11190] / [i915#17356]) -> [PASS][746] +1 other test pass
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-dg2:          [SKIP][747] ([i915#8825]) -> [PASS][748] +2 other tests pass
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][749] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][750] +1 other test pass
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [SKIP][751] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) -> [PASS][752] +1 other test pass
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - shard-dg2:          [SKIP][753] ([i915#15329]) -> [PASS][754] +14 other tests pass
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:
    - shard-dg2:          [SKIP][755] ([i915#15329] / [i915#17356]) -> [PASS][756] +4 other tests pass
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [SKIP][757] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][758]
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][759] ([i915#14544] / [i915#15073]) -> [PASS][760]
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          [SKIP][761] ([i915#15073]) -> [PASS][762] +1 other test pass
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [SKIP][763] ([i915#9519]) -> [PASS][764]
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          [SKIP][765] ([i915#11521]) -> [PASS][766] +1 other test pass
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_properties@plane-properties-legacy.html

  * igt@perf@polling:
    - shard-dg2:          [FAIL][767] ([i915#10538]) -> [PASS][768] +1 other test pass
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@perf@polling.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@perf@polling.html
    - shard-mtlp:         [FAIL][769] ([i915#10538]) -> [PASS][770]
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@perf@polling.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@perf@polling.html

  * igt@perf_pmu@rc6:
    - shard-tglu:         [WARN][771] ([i915#17771]) -> [PASS][772]
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-tglu:         [SKIP][773] ([i915#17771]) -> [PASS][774] +1 other test pass
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6@runtime-pm-long-gt0.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][775] ([i915#6230]) -> [SKIP][776] ([i915#14544] / [i915#6230])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@api_intel_bb@crc32.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@api_intel_bb@crc32.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][777] ([i915#6335]) -> [SKIP][778] ([i915#14544] / [i915#6335])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][779] ([i915#3281]) -> [SKIP][780] ([i915#14544] / [i915#3281]) +3 other tests skip
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][781] ([i915#14544] / [i915#3281]) -> [SKIP][782] ([i915#3281]) +2 other tests skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [ABORT][783] ([i915#15131] / [i915#15542]) -> [INCOMPLETE][784] ([i915#13356]) +1 other test incomplete
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          [SKIP][785] ([i915#14544] / [i915#4613]) -> [SKIP][786] ([i915#4613])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_lmem_swapping@random.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][787] ([i915#4613]) -> [SKIP][788] ([i915#14544] / [i915#4613]) +2 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@gem_lmem_swapping@verify-random.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          [SKIP][789] ([i915#17429]) -> [SKIP][790] ([i915#14544] / [i915#17429])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-1/igt@gem_mmap_gtt@coherency.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_mmap_gtt@coherency.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          [SKIP][791] ([i915#14544] / [i915#3282]) -> [SKIP][792] ([i915#3282]) +1 other test skip
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][793] ([i915#3282]) -> [SKIP][794] ([i915#14544] / [i915#3282]) +1 other test skip
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@gem_pread@display.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_pread@display.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][795] ([i915#14544] / [i915#17433] / [i915#3297]) -> [SKIP][796] ([i915#17433] / [i915#3297])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][797] ([i915#3282] / [i915#3297]) -> [SKIP][798] ([i915#14544] / [i915#3282] / [i915#3297])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gen3_render_tiledx_blits:
    - shard-rkl:          [SKIP][799] ([i915#17455]) -> [SKIP][800] ([i915#14544] / [i915#17455]) +1 other test skip
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@gen3_render_tiledx_blits.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][801] ([i915#14544] / [i915#2527]) -> [SKIP][802] ([i915#2527])
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-rkl:          [SKIP][803] ([i915#2527]) -> [SKIP][804] ([i915#14544] / [i915#2527])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@gen9_exec_parse@bb-large.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gen9_exec_parse@bb-large.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          [SKIP][805] ([i915#15678]) -> [SKIP][806] ([i915#14544] / [i915#15678])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@gpu_buddy@gpu_buddy.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          [SKIP][807] ([i915#8399]) -> [SKIP][808] ([i915#14544] / [i915#8399])
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@i915_pm_freq_api@freq-basic-api.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][809] ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][810] ([i915#16080] / [i915#16166])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][811] ([i915#9531]) -> [SKIP][812] ([i915#17356])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][813] ([i915#17356]) -> [SKIP][814] ([i915#1769] / [i915#3555])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          [SKIP][815] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][816] ([i915#1769] / [i915#3555])
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][817] ([i915#17431]) -> [SKIP][818] ([i915#17356]) +1 other test skip
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][819] ([i915#4538] / [i915#5286]) -> [SKIP][820] ([i915#14544] / [i915#4538] / [i915#5286]) +3 other tests skip
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][821] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][822] ([i915#4538] / [i915#5286]) +1 other test skip
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][823] ([i915#17431] / [i915#3638]) -> [SKIP][824] ([i915#14544] / [i915#17431] / [i915#3638]) +1 other test skip
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][825] ([i915#3828]) -> [SKIP][826] ([i915#14544] / [i915#3828])
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][827] ([i915#17356]) -> [SKIP][828] ([i915#17431]) +2 other tests skip
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-rkl:          [SKIP][829] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][830] ([i915#17431] / [i915#3638])
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][831] ([i915#17356] / [i915#5190]) -> [SKIP][832] ([i915#5190]) +4 other tests skip
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][833] ([i915#4538] / [i915#5190]) -> [SKIP][834] ([i915#17356] / [i915#5190]) +9 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][835] ([i915#4538]) -> [SKIP][836] ([i915#14544] / [i915#4538]) +2 other tests skip
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][837] ([i915#17356] / [i915#5190]) -> [SKIP][838] ([i915#4538] / [i915#5190]) +7 other tests skip
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][839] ([i915#14544] / [i915#6095]) -> [SKIP][840] ([i915#6095]) +3 other tests skip
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][841] ([i915#10307] / [i915#6095]) -> [SKIP][842] ([i915#17356]) +6 other tests skip
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
    - shard-rkl:          [SKIP][843] ([i915#14098] / [i915#6095]) -> [SKIP][844] ([i915#14098] / [i915#14544] / [i915#6095]) +10 other tests skip
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][845] ([i915#6095]) -> [SKIP][846] ([i915#14544] / [i915#6095]) +5 other tests skip
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][847] ([i915#17356]) -> [SKIP][848] ([i915#10307] / [i915#6095]) +9 other tests skip
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
    - shard-rkl:          [SKIP][849] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][850] ([i915#14098] / [i915#6095]) +6 other tests skip
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][851] ([i915#17356]) -> [SKIP][852] ([i915#12805])
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-mtlp:         [INCOMPLETE][853] ([i915#15582]) -> [FAIL][854] ([i915#17158])
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         [FAIL][855] ([i915#17158]) -> [INCOMPLETE][856] ([i915#15582])
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          [INCOMPLETE][857] ([i915#13356] / [i915#15582]) -> [INCOMPLETE][858] ([i915#13356] / [i915#14694] / [i915#15582])
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
    - shard-dg2:          [SKIP][859] ([i915#6095]) -> [SKIP][860] ([i915#17356]) +1 other test skip
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][861] ([i915#17356]) -> [SKIP][862] ([i915#6095])
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][863] ([i915#12313] / [i915#14544]) -> [SKIP][864] ([i915#12313])
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][865] ([i915#17356]) -> [SKIP][866] ([i915#16017])
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          [SKIP][867] ([i915#11151]) -> [SKIP][868] ([i915#11151] / [i915#14544])
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-rkl:          [SKIP][869] ([i915#17427]) -> [SKIP][870] ([i915#14544] / [i915#17427]) +1 other test skip
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_chamelium_color@ctm-max.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@gamma:
    - shard-rkl:          [SKIP][871] ([i915#14544] / [i915#17427]) -> [SKIP][872] ([i915#17427])
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_chamelium_color@gamma.html
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          [SKIP][873] ([i915#11151] / [i915#14544]) -> [SKIP][874] ([i915#11151])
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][875] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][876] ([i915#11151] / [i915#7828])
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          [SKIP][877] ([i915#11151] / [i915#7828]) -> [SKIP][878] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][879] ([i915#17356]) -> [SKIP][880] ([i915#15330] / [i915#3299])
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][881] ([i915#15865]) -> [SKIP][882] ([i915#17356])
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_content_protection@legacy.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][883] ([i915#15865]) -> [SKIP][884] ([i915#14544] / [i915#15865])
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_content_protection@legacy-hdcp14.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][885] ([i915#14544] / [i915#15865]) -> [SKIP][886] ([i915#15865])
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_content_protection@mei-interface.html
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          [SKIP][887] ([i915#17356]) -> [SKIP][888] ([i915#13049])
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-rkl:          [SKIP][889] ([i915#13049] / [i915#14544]) -> [SKIP][890] ([i915#13049])
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          [SKIP][891] ([i915#13049]) -> [SKIP][892] ([i915#17356]) +1 other test skip
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          [SKIP][893] ([i915#17356]) -> [SKIP][894] ([i915#3555]) +3 other tests skip
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-rkl:          [SKIP][895] ([i915#3555]) -> [SKIP][896] ([i915#14544] / [i915#3555])
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_cursor_crc@cursor-random-32x32.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          [SKIP][897] ([i915#3555]) -> [SKIP][898] ([i915#17356])
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][899] ([i915#13049]) -> [SKIP][900] ([i915#13049] / [i915#14544]) +1 other test skip
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          [SKIP][901] ([i915#17356]) -> [SKIP][902] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          [SKIP][903] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][904] ([i915#17356]) +3 other tests skip
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          [SKIP][905] ([i915#4103]) -> [SKIP][906] ([i915#14544] / [i915#4103])
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][907] ([i915#9833]) -> [SKIP][908] ([i915#17356])
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [SKIP][909] ([i915#17356]) -> [SKIP][910] ([i915#17288])
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          [SKIP][911] ([i915#17356]) -> [SKIP][912] ([i915#17286])
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-rkl:          [SKIP][913] ([i915#14544] / [i915#17286]) -> [SKIP][914] ([i915#17286])
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][915] ([i915#17285]) -> [SKIP][916] ([i915#14544] / [i915#17285])
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-dg2:          [SKIP][917] ([i915#17356]) -> [SKIP][918] ([i915#17285])
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-direct-train.html
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg2:          [SKIP][919] ([i915#16867]) -> [SKIP][920] ([i915#17356])
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-rkl:          [SKIP][921] ([i915#16867]) -> [SKIP][922] ([i915#14544] / [i915#16867])
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          [SKIP][923] ([i915#14544] / [i915#16361]) -> [SKIP][924] ([i915#16361]) +1 other test skip
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-dg2:          [SKIP][925] ([i915#17356]) -> [SKIP][926] ([i915#16361]) +2 other tests skip
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][927] ([i915#16361]) -> [SKIP][928] ([i915#14544] / [i915#16361]) +1 other test skip
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          [SKIP][929] ([i915#16361]) -> [SKIP][930] ([i915#17356]) +3 other tests skip
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][931] ([i915#14544] / [i915#16680]) -> [SKIP][932] ([i915#16680])
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][933] ([i915#16084]) -> [SKIP][934] ([i915#14544] / [i915#16084])
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_feature_discovery@chamelium.html
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          [SKIP][935] ([i915#17356]) -> [SKIP][936] ([i915#4881])
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_fence_pin_leak.html
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][937] ([i915#14544] / [i915#9934]) -> [SKIP][938] ([i915#9934]) +3 other tests skip
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          [SKIP][939] ([i915#9934]) -> [SKIP][940] ([i915#14544] / [i915#9934]) +3 other tests skip
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][941] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][942] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][943] ([i915#15643]) -> [SKIP][944] ([i915#14544] / [i915#15643])
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][945] ([i915#14544] / [i915#15643]) -> [SKIP][946] ([i915#15643])
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][947] ([i915#17452]) -> [SKIP][948] ([i915#14544] / [i915#17452])
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][949] ([i915#16708]) -> [SKIP][950] ([i915#15104] / [i915#15990]) +2 other tests skip
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][951] ([i915#15990] / [i915#8708]) -> [SKIP][952] ([i915#16708] / [i915#5354]) +8 other tests skip
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][953] ([i915#16708] / [i915#5354]) -> [SKIP][954] ([i915#15990] / [i915#8708]) +15 other tests skip
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][955] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][956] ([i915#17428] / [i915#1825]) +1 other test skip
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][957] ([i915#16708] / [i915#5354]) -> [SKIP][958] ([i915#15991] / [i915#5354]) +28 other tests skip
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          [SKIP][959] ([i915#16708] / [i915#5354]) -> [SKIP][960] ([i915#10055])
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][961] ([i915#15990]) -> [SKIP][962] ([i915#16708]) +16 other tests skip
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][963] ([i915#15991]) -> [SKIP][964] ([i915#16708]) +26 other tests skip
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][965] ([i915#15104] / [i915#15990]) -> [SKIP][966] ([i915#16708])
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][967] ([i915#16708]) -> [SKIP][968] ([i915#15102]) +16 other tests skip
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][969] ([i915#17428] / [i915#1825]) -> [SKIP][970] ([i915#14544] / [i915#17428] / [i915#1825]) +3 other tests skip
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][971] ([i915#14544] / [i915#17428]) -> [SKIP][972] ([i915#17428]) +29 other tests skip
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][973] ([i915#16708] / [i915#5354]) -> [SKIP][974] ([i915#15102]) +8 other tests skip
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][975] ([i915#15102]) -> [SKIP][976] ([i915#16708] / [i915#5354]) +11 other tests skip
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][977] ([i915#5439]) -> [SKIP][978] ([i915#14544] / [i915#5439])
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][979] ([i915#15102]) -> [SKIP][980] ([i915#14544] / [i915#15102]) +18 other tests skip
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][981] ([i915#15989]) -> [SKIP][982] ([i915#16708]) +10 other tests skip
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][983] ([i915#16708]) -> [SKIP][984] ([i915#15990]) +20 other tests skip
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][985] ([i915#16708]) -> [SKIP][986] ([i915#15991]) +28 other tests skip
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-dg2:          [SKIP][987] ([i915#16708]) -> [SKIP][988] ([i915#15989]) +13 other tests skip
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][989] ([i915#14544] / [i915#15102]) -> [SKIP][990] ([i915#15102]) +14 other tests skip
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][991] ([i915#15991] / [i915#5354]) -> [SKIP][992] ([i915#16708] / [i915#5354]) +13 other tests skip
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2:          [SKIP][993] ([i915#15102]) -> [SKIP][994] ([i915#16708]) +10 other tests skip
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][995] ([i915#17428]) -> [SKIP][996] ([i915#14544] / [i915#17428]) +31 other tests skip
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         [ABORT][997] ([i915#15840]) -> [FAIL][998] ([i915#17101] / [i915#17108] / [i915#17188])
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][999] ([i915#1187] / [i915#12713] / [i915#16644]) -> [SKIP][1000] ([i915#12713] / [i915#16644])
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][1001] ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][1002] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228])
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_hdr@invalid-hdr.html
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][1003] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][1004] ([i915#17356]) +1 other test skip
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][1005] ([i915#15460]) -> [SKIP][1006] ([i915#14544] / [i915#15460])
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][1007] ([i915#15458]) -> [SKIP][1008] ([i915#14544] / [i915#15458])
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg2:          [SKIP][1009] ([i915#17356]) -> [SKIP][1010] ([i915#16451])
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][1011] ([i915#6301]) -> [SKIP][1012] ([i915#17356])
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][1013] ([i915#14544] / [i915#15709]) -> [SKIP][1014] ([i915#15709]) +2 other tests skip
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          [SKIP][1015] ([i915#17356]) -> [SKIP][1016] ([i915#13958]) +1 other test skip
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          [SKIP][1017] ([i915#13958]) -> [SKIP][1018] ([i915#17356])
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-x.html
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-rkl:          [SKIP][1019] ([i915#13958]) -> [SKIP][1020] ([i915#13958] / [i915#14544]) +1 other test skip
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-x.html
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][1021] ([i915#12343] / [i915#5354]) -> [SKIP][1022] ([i915#12343] / [i915#14544] / [i915#5354])
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][1023] ([i915#12343]) -> [SKIP][1024] ([i915#12343] / [i915#14544])
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][1025] ([i915#15739]) -> [SKIP][1026] ([i915#14544] / [i915#15739])
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          [SKIP][1027] ([i915#3828]) -> [SKIP][1028] ([i915#9340])
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][1029] ([i915#8430]) -> [SKIP][1030] ([i915#14544] / [i915#8430])
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-rkl:          [SKIP][1031] ([i915#11520]) -> [SKIP][1032] ([i915#11520] / [i915#14544])
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][1033] ([i915#11520] / [i915#14544]) -> [SKIP][1034] ([i915#11520])
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][1035] ([i915#9683]) -> [SKIP][1036] ([i915#14544] / [i915#9683]) +1 other test skip
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-rkl:          [SKIP][1037] ([i915#1072] / [i915#9732]) -> [SKIP][1038] ([i915#1072] / [i915#14544] / [i915#9732]) +10 other tests skip
   [1037]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-2/igt@kms_psr@fbc-pr-suspend.html
   [1038]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][1039] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1040] ([i915#1072] / [i915#9732]) +6 other tests skip
   [1039]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [1040]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][1041] ([i915#5289]) -> [SKIP][1042] ([i915#14544] / [i915#5289])
   [1041]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [1042]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][1043] ([i915#17356] / [i915#5190]) -> [SKIP][1044] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [1043]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [1044]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][1045] ([i915#12755] / [i915#15867]) -> [SKIP][1046] ([i915#17356])
   [1045]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html
   [1046]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          [SKIP][1047] ([i915#17356]) -> [SKIP][1048] ([i915#12755] / [i915#15867]) +1 other test skip
   [1047]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [1048]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          [SKIP][1049] ([i915#14544] / [i915#3555]) -> [SKIP][1050] ([i915#3555]) +2 other tests skip
   [1049]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html
   [1050]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          [SKIP][1051] ([i915#17356]) -> [SKIP][1052] ([i915#8623])
   [1051]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [1052]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-rkl:          [SKIP][1053] ([i915#17445]) -> [SKIP][1054] ([i915#14544] / [i915#17445])
   [1053]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-4/igt@kms_tv_load_detect@load-detect.html
   [1054]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][1055] ([i915#9906]) -> [SKIP][1056] ([i915#14544] / [i915#9906]) +1 other test skip
   [1055]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html
   [1056]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][1057] ([i915#14544] / [i915#2436]) -> [SKIP][1058] ([i915#2436])
   [1057]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [1058]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [FAIL][1059] ([i915#17119]) -> [ABORT][1060] ([i915#17131])
   [1059]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-tglu-9/igt@perf_pmu@module-unload.html
   [1060]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][1061] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][1062] ([i915#17448] / [i915#3708])
   [1061]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [1062]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@prime_vgem@fence-write-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15511
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16396]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16396
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16472]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16472
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17131
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17170
  [i915#17171]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17189]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189
  [i915#17190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190
  [i915#17214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214
  [i915#17245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17319]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319
  [i915#17327]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17345
  [i915#17349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17446]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17469
  [i915#17471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17486]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486
  [i915#17487]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17487
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17514]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17519
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17549
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17560
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17563]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17563
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17572]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17572
  [i915#17573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581
  [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
  [i915#17585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17596]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17596
  [i915#17597]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17604
  [i915#17606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17615]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615
  [i915#17616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616
  [i915#17617]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17617
  [i915#17620]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17620
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622
  [i915#17626]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17626
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17633]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17633
  [i915#17635]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17635
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17641]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17641
  [i915#17645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17645
  [i915#17646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17646
  [i915#17647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17647
  [i915#17654]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17654
  [i915#17656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17656
  [i915#17657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17657
  [i915#17658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17658
  [i915#17659]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17659
  [i915#17662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17662
  [i915#17667]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17667
  [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
  [i915#17672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17672
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#17676]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17676
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#17681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17681
  [i915#17682]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17682
  [i915#17683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17683
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17698]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17710]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17753]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17753
  [i915#17771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17771
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9177 -> IGTPW_16095

  CI-20190529: 20190529
  CI_DRM_19443: d11bbfdac0f3d443b367857ffe683ae6bb80d560 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16095: 16095
  IGT_9177: 9177

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/index.html

--===============6433208895409205047==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] tests/in=
tel/xe_exec_threads: Parametrise worker and queue counts</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177626/">https://patchwork.freedesktop.org/series/177626/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9177_full -&gt; IGTPW_16095_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16095_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16095_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1609=
5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-b-hdmi-a-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@perf_pmu@rc6@gt0.html">FAIL</a> +=
1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17752">i915#17752</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_cursor_crc@cursor-suspend@pi=
pe-b-hdmi-a-1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16095_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@api_intel_allocator@execbuf-with-a=
llocator.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17647">i915#17647</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@api_intel_bb@blit-noreloc-purge-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17667">i915#17667</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@api_intel_bb@blit-reloc-keep-cac=
he.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@api_intel_bb@delta-check.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7645">i915#17645</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-simple:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@api_intel_bb@object-noreloc-keep-c=
ache-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17641">i915#17641</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@device_reset@cold-reset-bound.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17620">i915#17620</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@device_reset@cold-reset-bound.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17537">i915#17537</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@device_reset@unbind-reset-rebind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17753">i915#17753</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@fault-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@drm_read@fault-buffer.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
59">i915#17359</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@fbdev@write.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@fbdev@write=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_bad_reloc@negative-reloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17682">i915#17682</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ccs@block-copy-uncompressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17499">i915#17499</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_ccs@block-copy-uncompressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-com=
pressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#163=
48</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_close_race@multigpu-basic-thre=
ads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_close_race@multigpu-basic-thre=
ads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17530">i915#17530</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ctx_isolation@preservation-s3=
@rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@get-priority-new-ctx:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@gem_ctx_param@get-priority-new-ctx=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17646">i915#17646</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ctx_param@set-priority-not-su=
pported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17535">i915#17535</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_ctx_persistence@engines-hang@=
bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17527">i915#17527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@gem_ctx_persistence@hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@gem_ctx_persistence@legacy-engines=
-hang@blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_ctx_persistence@legacy-engines=
-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1099">i915#1099</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ctx_persistence@saturated-host=
ile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17621">i915#17621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-promotion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@gem_ctx_shared@q-promotion.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17342">i915#17342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"=
>i915#280</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1749=
6">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/i=
gt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">i915#173=
27</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/889=
8">i915#8898</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_exec_balancer@fairslice.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_exec_balancer@parallel.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17587">i915#17587</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@gem_exec_balancer@parallel-keep-su=
bmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17547">i915#17547</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_exec_fence@parallel.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
599">i915#17599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_exec_flush@basic-uc-ro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd2-flag-on-vebox:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_exec_params@invalid-bsd2-flag-=
on-vebox.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17659">i915#17659</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17662">i915#17662</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_exec_reloc@basic-wc-cpu-activ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_exec_schedule@preemptive-hang.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17590">i915#17590</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@gem_exec_schedule@reorder-wide.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/i=
gt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other =
test incomplete</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/i=
gt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_exec_suspend@basic-s3.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13196">i915#13196</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_exec_whisper@basic-queues-prio=
rity-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17628">i915#17628</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gem_exercise_blt@fast-copy-emit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17622">i915#17622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify=
-threaded-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-ra=
ndom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4565">i915#4565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_lmem_swapping@parallel-random-=
verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17503">i915#17503</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12193">i915#12193</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_lmem_swapping@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543">i915#=
17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@gem_mmap_gtt@basic-write-cpu-read-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17572">i915#17572</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_mmap_gtt@medium-copy-xy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_mmap_wc@read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ppgtt@flink-and-close-vma-leak=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17635">i915#17635</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@shrink-vs-evict-any:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_ppgtt@shrink-vs-evict-any.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17615">i915#17615</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@gem_pread@snoop.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i9=
15#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_pwrite@basic-self.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@gem_pxp@create-protected-buffer.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-=
copy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@gem_pxp@verify-pxp-key-change-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@gem_readwrite@write-bad-handle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_render_copy@x-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17591">i915#17591</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17492">i915#17492</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-=
to-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@gem_render_copy@yf-tiled-mc-ccs-t=
o-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_softpin@evict-snoop-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17471">i915#17471</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17430">i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@gem_softpin@noreloc-s3.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13809">i915#13809</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-2/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tglu-5/ig=
t@gem_softpin@noreloc-s3.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@gem_userptr_blits@coherency-sync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@gem_userptr_blits@invalid-mmap-of=
fset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17507">i915#17507</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@gem_userptr_blits@readonly-pwrite=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gem_userptr_blits@readonly-unsync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_vm_create@create-ext.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7596">i915#17596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_watchdog@default-virtual:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@gem_watchdog@default-virtual.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17654">i915#17654</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@gen3_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i=
915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@gen3_render_linear_blits.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17455">i915#17455</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gen3_render_tiledx_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@gen3_render_tiledy_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@gen7_exec_parse@basic-offset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@gen7_exec_parse@bitmasks.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7505">i915#17505</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@gen7_exec_parse@bitmasks.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gen7_exec_parse@cmd-crossing-page=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk3/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk2/i=
gt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@gen9_exec_parse@allowed-single.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17597">i915#17597</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@gen9_exec_parse@batch-zero-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@gen9_exec_parse@bb-chained.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@gpu_buddy@gpu_buddy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514"=
>i915#17514</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@gpu_buddy@gpu_buddy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514"=
>i915#17514</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@i915_drm_fdinfo@busy-check-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11527">i915#11527</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@i915_drm_fdinfo@busy-check-all.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17603">i915#17603</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@i915_drm_fdinfo@virtual-busy-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@i915_fb_tiling@basic-x-tiling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@i915_hangman@engine-engine-error@b=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@i915_hangman@engine-engine-hang.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17610">i915#17610</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@i915_module_load@fault-injection@=
intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@i915_pm_freq_api@freq-reset-multip=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17526">i915#17526</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@i915_pm_freq_api@freq-reset-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-m=
tlp-7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a>) +1 =
other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf-stress-pc=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf-stress-p=
c8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@i915_pm_rps@thresholds-idle.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-8/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt=
@i915_pm_rps@waitboost.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15365">i915#15365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17584">i915#17584</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@i915_query@query-topology-unsuppor=
ted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17563">i915#17563</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@i915_query@query-topology-unsupp=
orted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp=
-8/igt@i915_suspend@debugfs-reader.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17170">i915#17170</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171">i915#171=
71</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@i915_suspend@forcewake.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_addfb_basic@addfb25-y-tiled-sm=
all-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17469">i915#17469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17668">i915#17668</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-o=
n-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17668">i915#17668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_async_flips@async-flip-suspend=
-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +1 other test =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_atomic_transition@plane-all-=
modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_big_fb@4-tiled-16bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_big_fb@4-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17478">i915#17478</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 othe=
r tests skip</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-64=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_big_fb@linear-max-hw-stride-64=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/sha=
rd-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356<=
/a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_big_fb@x-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17500">i915#17500</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_big_fb@x-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_big_fb@y-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17500">i915#17500</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_big_fb@y-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_big_fb@yf-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17557">i915#17557</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16095/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13363">i915#13363</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16095/shard-tglu-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@=
pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16095/shard-tglu-4/igt@kms_busy@extended-modeset-hang-newfb-with=
-reset@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17147">i915#17147</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@p=
ipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-r=
eset@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17147">i915#17147</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +28 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +132 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_ccs@ccs-on-another-bo-yf-tiled=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17594">i915#17594</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_ccs@crc-primary-rotation-180-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a=
-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#1=
0434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +63 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +43 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">=
i915#15582</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-til=
ed-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6=
095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16095/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-c=
cs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i91=
5#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +40 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_ccs@random-ccs-data-y-tiled-ge=
n12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +121 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_cdclk@mode-transition-all-outp=
uts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17550">i915#17550</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_chamelium_color@ctm-0-25.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_chamelium_color@ctm-0-50.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_chamelium_color@ctm-0-75.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 o=
ther tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +5 other t=
ests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_chamelium_color_pipeline@plane=
-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17497">i915#17497</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_chamelium_color_pipeline@pla=
ne-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-after-r=
untime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_chamelium_hpd@hdmi-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17483">i915#17483</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_chamelium_hpd@hdmi-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17483">i915#17483</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_chamelium_hpd@vga-hpd-fast.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17483">i915#17483</a>) +12 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_color@gamma.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_col=
or@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_color@invalid-degamma-lut-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17656">i915#17656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_color@invalid-degamma-lut-size=
s@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17657">i915#17657</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_color_pipeline@plane-ctm3x4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17510">i915#17510</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_color_pipeline@plane-ctm3x4-=
lut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_color_pipeline@plane-fixed-ma=
trix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6095/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
529">i915#15529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_color_pipeline@plane-lut1d-po=
st-ctm3x4@pipe-c-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17508">i915#17508</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_content_protection@dp-mst-lic-=
type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_content_protection@legacy-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_content_protection@srm.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17508">i915#17508</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_cursor_crc@cursor-offscreen-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17533">i915#17533</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-12=
8x42.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128=
x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_cursor_crc@cursor-random-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_cursor_crc@cursor-random-512x1=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17533">i915#17533</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_cursor_crc@cursor-random-max-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17504">i915#17504</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mt=
lp-6/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17157">i915#17157</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-nonblo=
cking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_cursor_legacy@cursora-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#535=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_cursor_legacy@modeset-atomic-c=
ursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17549">i915#17549</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>=
)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_display_modes@extended-mode-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_dp_link_training@non-uhbr-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17560">i915#17560</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_dp_link_training@non-uhbr-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17560">i915#17560</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17519">i915#17519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_dp_link_training@non-uhbr-mst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17616">i915#17616</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-ms=
t-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17291">i915#17291</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_dp_link_training@non-uhbr-mst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17616">i915#17616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_dp_link_training@non-uhbr-sst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17506">i915#17506</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-ss=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_dp_link_training@non-uhbr-sst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17506">i915#17506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-ss=
t-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17290">i915#17290</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst=
-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_dp_link_training@uhbr-mst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_dp_link_training@uhbr-sst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_dp_link_training@uhbr-sst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_dsc@dsc-with-formats-bigjoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17458">i915#17458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_dsc@dsc-with-output-formats.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17458">i915#17458</a>) +6 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-u=
ltrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_f=
bcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">i=
915#17516</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">i=
915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16680">i915#16680</a>)</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8=
/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17189">i915#17189</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349">i915#17349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_feature_discovery@chamelium.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17581">i915#17581</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17581">i915#17581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_feature_discovery@vrr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_feature_discovery@vrr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ac-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#171=
83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_flip@2x-flip-vs-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16095/shard-mtlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_flip@flip-vs-suspend.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17214">i915#17214</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095=
/shard-mtlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1647=
2">i915#16472</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-vga1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15840">i915#15840</a>) +8 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1609=
5/shard-dg2-7/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i9=
15#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4ti=
le-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile=
-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-li=
near-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-xt=
ile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-ind=
fb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indf=
b-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-=
1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +21 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-in=
dfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16095/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-pr=
imscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +58 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-=
farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +138 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i=
915#1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +172 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17482">i915#17482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-rende=
r:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +41 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +42 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +27 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +62 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +28 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-ind=
fb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +31 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-2p-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17428">i915#17428</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +75 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-ind=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb1=
01010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_frontbuffer_tracking@hdr-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_frontbuffer_tracking@pipe-fbc-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17534">i915#17534</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17588">i915#17588</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_frontbuffer_tracking@pipe-fbc-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17534">i915#17534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_frontbuffer_tracking@psr-shrfb=
-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17606">i915#17606</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2=
p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_frontbuffer_tracking@psrhdr-2p=
-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +63 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_frontbuffer_tracking@psrhdr-=
rgb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15989">i915#15989</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-nv12:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_getfb@getfb2-accept-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17658">i915#17658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_hdmi_audio_bw@suspend-disk-au=
dio-recovery.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_hdmi_audio_bw@suspend-mem-audi=
o-recovery.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_hdmi_inject@inject-4k.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17681">i915#17681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_hdr@brightness-with-hdr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_hdr@invalid-metadata-sizes.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17498">i915#17498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16490">i915#16490</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_hdr@static-toggle-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17498">i915#17498</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7=
/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_joiner@basic-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_joiner@invalid-modeset-big-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_joiner@invalid-modeset-force-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17567">i915#17567</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_pipe_b_c_ivb@from-pipe-c-to-=
b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17455">i915#17455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17540">i915#17540</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-=
modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shar=
d-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_pipe_stress@stress-xrgb8888-yf=
tiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16396">i915#16396</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-y=
ftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-d=
g2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifie=
r.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16095/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8825">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17479">i915#17479</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk4/igt@kms_plane@pixel-format-y-tiled-ccs=
-modifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_plane@pixel-format-y-tiled-gen=
12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-cc=
s-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17595">i915#17595</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_plane_lowres@tiling-y.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-no=
ne.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_plane_multiple@tiling-4.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17542">i915#17542</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_plane_multiple@tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_plane_multiple@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_plane_scaling@invalid-paramete=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17626">i915#17626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_plane_scaling@plane-downscale-=
factor-0-5-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-rotation.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-facto=
r-0-5-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-rotation@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_plane_scaling@plane-downsca=
le-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_plane_scaling@plane-downscale-=
factor-0-75-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_plane_scaling@plane-scaler-uni=
ty-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@plane-scaler=
-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#1=
7356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17528">i915#17528</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests ski=
p</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i=
915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-c:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75-upscale-20x20@pipe-c.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i91=
5#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_plane_scaling@planes-=
upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</=
a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_pm_backlight@bad-brightness.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17462">i915#17462</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_pm_backlight@brightness-with-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_pm_dc@dc5-dpms-suspend-resume.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_pm_dc@dc5-pageflip-negative.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17495">i915#17495</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">=
i915#15948</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602">i=
915#17602</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17573">i915#17573</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17633">i915#17633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_pm_rpm@cursor.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i=
915#17473</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-=
dg1-16/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_pm_rpm@fences.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shar=
d-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
095/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_pm_rpm@pc8-residency.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7710">i915#17710</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard=
-dg2-7/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446">i915#17446</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">=
i915#3547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_prime@basic-modeset-hybrid.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17569">i915#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_prime@d3hot.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i91=
5#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk1/igt@kms_psr@fbc-pr-primary-mmap-cpu.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17480">i915#17480</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-3/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9688">i915#9688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_psr@fbc-psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17480">i915#17480</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_psr@pr-cursor-mmap-cpu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_psr@psr-cursor-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_psr@psr-sprite-plane-onoff.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_psr@psr2-cursor-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17480">i915#17480</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@kms_rotation_crc@bad-pixel-format.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17488">i915#17488</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_rotation_crc@exhaust-fences.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17676">i915#17676</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_setmode@invalid-clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17463">i915#17463</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb1/igt@kms_setmode@invalid-clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17604">i915#17604</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_tiled_display@basic-test-patte=
rn-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17672">i915#17672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_tv_load_detect@load-detect.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_vblank@ts-continuation-suspend=
@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk2/igt@kms_vrr@flip-basic-fastset.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17520">i915#17520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_vrr@flip-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">=
i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@kms_vrr@flip-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520=
">i915#17520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk5/igt@kms_vrr@lobf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#1=
7561</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb6/igt@kms_vrr@lobf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#1=
7561</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-17/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@kms_vrr@seamless-rr-switch-drrs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17520">i915#17520</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk8/igt@perf@gen12-oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17536">i915#17536</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-16/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@perf@mi-rpc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592">i915#17=
592</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17704">i915#17704</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-=
mtlp-5/igt@perf_pmu@busy-double-start@vcs0.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk9/igt@perf_pmu@event-wait.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698"=
>i915#17698</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@=
perf_pmu@rc6-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17245">i915#17245</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@perf_pmu@semaphore-busy@bcs0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17683">i915#17683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb4/igt@perf_pmu@semaphore-busy@vcs0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17637">i915#17637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg1-15/igt@prime_vgem@basic-fence-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk6/igt@prime_vgem@coherency-gtt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7467">i915#17467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-glk11/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb5/igt@prime_vgem@fence-read-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-tglu-10/igt@prime_vgem@fence-read-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17448">i915#17448</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-2/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-snb7/igt@sysfs_timeslice_duration@idempoten=
t@vcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17632">i915#17632</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#=
17359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16095/shard-dg2-6/igt@drm_read@short-buffer-wakeup.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt=
@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0=
-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt=
@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@gem_eio@hibernate.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i915#171=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7975">i915#7975</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16095/shard-mtlp-7/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i=
915#17190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16095/shard-mtlp-3/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress@render:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-2/igt@gem_eio@unwedge-stress@render.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15511">i9=
15#15511</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16095/shard-mtlp-8/igt@gem_eio@unwedge-stress@render.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-re=
fcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@gem_pxp@dmabuf-shared-prot=
ected-dst-is-context-refcounted.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16095/shard-rkl-3/igt@gem_workarounds@suspend-resume.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-=
mtlp-6/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-rkl-8/igt@i915_suspend@fence-restore-untiled.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17037">i915#17037</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_async_flips@async-flip-suspe=
nd-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b=
-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-8/igt@kms_async_flips@async-fli=
p-suspend-resume@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_atomic_interruptible@atomic-setmode.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16095/shard-dg2-4/igt@kms_atomic_interruptible@atomic-setmode.ht=
ml">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_atomic_transition@p=
lane-all-modeset-transition-fencing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pi=
pe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_ccs@crc-p=
rimary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@p=
ipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_ccs@crc-pr=
imary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17345">i915#17345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@p=
ipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-=
suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdm=
i-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_cc=
s@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_color@degamma.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">=
i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16095/shard-dg2-4/igt@kms_color@degamma.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2=
020-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi=
-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@kms_cursor_crc@cursor-onscre=
en-256x85@pipe-a-hdmi-a-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16095/shard-tglu-8/igt@kms_cursor_crc@cursor-random=
-256x85@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#1=
5840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6095/shard-tglu-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i91=
5#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16095/shard-dg2-5/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> +6 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4ti=
ledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@=
kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html"=
>PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_track=
ing@fbc-1p-offscreen-pri-shrfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pg=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontb=
uffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> +3 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk8/igt@kms_frontbuffer_track=
ing@hdr-2p-primscrn-cur-indfb-draw-render.html">PASS</a> +6 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-fa=
rfromfence-mmap-gtt.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_hdmi_audio_bw@suspend-mem-audio-r=
ecovery.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-4/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319">=
i915#17319</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16095/shard-mtlp-5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i=
915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_invalid_mode@bad-hsync-start.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_pipe_crc_basic=
@compare-crc-sanitycheck-xr24.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-cl=
amping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_plane@pixel-format-x-til=
ed-modifier-source-clamping.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-=
rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-=
5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg=
2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_plane_scaling@planes-scal=
er-unity-scaling@pipe-a.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pip=
e-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_plane_sca=
ling@planes-scaler-unity-scaling@pipe-d.html">PASS</a> +4 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt=
@kms_plane_scaling@planes-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16095/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/s=
hard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915=
#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16095/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
521">i915#11521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-dg2-8/igt@kms_properties@plane-properties-legacy.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@perf@polling.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-=
8/igt@perf@polling.html">PASS</a> +1 other test pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@perf@polling.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-mtl=
p-7/igt@perf@polling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6.html">WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17771">i915#17771</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-tgl=
u-7/igt@perf_pmu@rc6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17771">=
i915#17771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16095/shard-tglu-7/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-=
rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanit=
y-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16095/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15=
131</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15542">i915#15542</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16095/shard-rkl-5/igt@gem_lmem_swapping@random.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i91=
5#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i91=
5#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16095/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-1/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/=
shard-rkl-6/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#=
17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-3/igt@gem_partial_pwrite=
_pread@writes-after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@gem_pread@display.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-r=
kl-6/igt@gem_pread@display.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@gem_userptr_blits@c=
oherency-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@gem_userptr_blits@forbidden-ope=
rations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#174=
55</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
95/shard-rkl-6/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">=
i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16095/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095=
/shard-rkl-6/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/sha=
rd-rkl-6/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i91=
5#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16095/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@i915_pm_r=
c6_residency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9531">i915#9531</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutab=
le-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_atomic_tran=
sition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/sha=
rd-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-pa=
nels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431=
">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16095/shard-dg2-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@4-t=
iled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i91=
5#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-h=
flip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard=
-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">=
i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16095/shard-dg2-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1743=
1">i915#17431</a>) +2 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_big_fb@x-tile=
d-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_big_fb@y-tiled-add=
fb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180=
-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@km=
s_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538=
">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16095/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe=
-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_ccs=
@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_ccs@bad-pixel-format=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17356">i915#17356</a>) +6 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@bad-pixel-format=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b=
-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4=
-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests s=
kip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@km=
s_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16095/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-mc-ccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16095/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-glk3/igt@kms_ccs@crc-primary-su=
spend-y-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915=
#15582</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16095/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_ccs@crc-sprite=
-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16095/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#1=
7427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6095/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16095/shard-rkl-7/igt@kms_chamelium_color@gamma.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427"=
>i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3=
hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_chamelium=
_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_cha=
melium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#78=
28</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i91=
5#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16095/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915=
#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16095/shard-dg2-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17=
356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_content_protection@legacy-hdcp14.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16095/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16095/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-max-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16095/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_cursor=
_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-a=
tomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_cursor_legacy=
@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915=
#9833</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16095/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17=
356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">=
i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16095/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288"=
>i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-d=
irect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17286">i915#17286</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_dp_link_trainin=
g@non-uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-tr=
ain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-direct-train.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst-direct-tr=
ain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16867">i915#16867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-h=
br-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16867">i915#16867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-h=
br-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16095/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats=
-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16680">i915#16680</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16095/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i9=
15#16084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16095/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_fence_pin_leak.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shar=
d-dg2-4/igt@kms_fence_pin_leak.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@kms_flip@2x-modeset=
-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip=
-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-gl=
k2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#127=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4ti=
ledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_flip_s=
caled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4ti=
ledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/=
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17452">i915#17452</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_force_connector_basic@force-load-d=
etect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_=
tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#151=
04</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15990">i915#15990</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbu=
ffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"=
>i915#5354</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990=
">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8708">i915#8708</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/sha=
rd-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/535=
4">i915#5354</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer=
_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-i=
ndfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_=
tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/ig=
t@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-4/igt@km=
s_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428"=
>i915#17428</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-=
cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_frontbuffer=
_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-sp=
r-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_t=
racking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</=
a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-3/igt@kms_frontbuffer_tr=
acking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>=
) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrf=
b-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-5/igt@kms_frontbuffer_tracki=
ng@hdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +28 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1670=
8">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16095/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuf=
fer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_frontbuffer_track=
ing@psrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +10 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_frontbuffer=
_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17428">i915#17428</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15840">i915#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-tglu-7/igt@kms_hdmi_audio_bw@suspend-disk-au=
dio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#11=
87</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@kms_hdr@brightness-with-=
hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i91=
5#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_hdr@invalid-metadat=
a-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
60">i915#15460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16095/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16095/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#164=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16095/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modi=
fier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-7/=
igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">=
i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16095/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16095/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16095/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#=
13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">=
i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/123=
43">i915#12343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16095/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shar=
d-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/sha=
rd-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8=
430</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
095/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
30">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16095/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-=
exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@k=
ms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/115=
20">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16095/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-2/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732=
">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16095/shard-rkl-6/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16095/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflec=
t-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16095/shard-dg2-8/igt@kms_rotation_crc@prima=
ry-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#=
5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1275=
5">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16095/shard-dg2-7/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16095/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-=
pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16095/shard-rkl-7/igt@kms_scaling_modes@scaling-mode=
-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16095/shard-dg2-6/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i91=
5#17445</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16095/shard-rkl-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#990=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1609=
5/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-8/igt@perf@gen8-unprivileged-si=
ngle-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-tglu-9/igt@perf_pmu@module-unload.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119">i915#171=
19</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
95/shard-tglu-3/igt@perf_pmu@module-unload.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17131">i915#17131</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9177/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16095/shard-rkl-5/igt@prime_vgem@fence-write-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9177 -&gt; IGTPW_16095</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19443: d11bbfdac0f3d443b367857ffe683ae6bb80d560 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16095: 16095<br />
  IGT_9177: 9177</p>

</body>
</html>

--===============6433208895409205047==--
