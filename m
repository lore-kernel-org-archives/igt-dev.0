Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7D606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F4210FCF2;
	Wed, 28 Oct 2026 14:46:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46610FD28;
 Wed, 28 Oct 2026 14:45:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2030019785082646084=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/msm/msm=5Fbo=3A_Ex?=
 =?utf-8?q?tend_buffer_object_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jitta Vignan" <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Oct 2026 14:45:10 -0000
Message-ID: <179319871008.82463.2496582491584764388@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
In-Reply-To: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
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

--===============2030019785082646084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm/msm_bo: Extend buffer object test
URL   : https://patchwork.freedesktop.org/series/177014/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9169_full -> IGTPW_16060_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16060_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16060_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16060_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@wc:
    - shard-tglu:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-2/igt@gem_userptr_blits@map-fixed-invalidate-busy@wc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@gem_userptr_blits@map-fixed-invalidate-busy@wc.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-glk:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          [SKIP][4] ([i915#4103]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  
New tests
---------

  New tests have been introduced between IGT_9169_full and IGTPW_16060_full:

### New IGT tests (1) ###

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_16060_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][6] ([i915#11814])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][7] -> [SKIP][8] ([i915#2582])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@fbdev@pan.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@fbdev@pan.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_basic@multigpu-create-close.html
    - shard-glk:          NOTRUN -> [SKIP][10] ([i915#17697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-glk11:        NOTRUN -> [SKIP][11] ([i915#17499]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-glk10:        NOTRUN -> [SKIP][12] ([i915#17499])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html
    - shard-snb:          NOTRUN -> [SKIP][14] ([i915#17499])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][18] ([i915#17499])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][19] ([i915#13356] / [i915#16348])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#6335])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-snb:          NOTRUN -> [SKIP][22] ([i915#17513])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#6335])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([i915#17513])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][27] -> [FAIL][28] ([i915#9561]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][29] ([i915#13356]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html
    - shard-mtlp:         NOTRUN -> [FAIL][30] ([i915#17176]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][31] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#17444])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk11:        NOTRUN -> [SKIP][33] ([i915#17527])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#8555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#8555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][36] ([i915#1099])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#5882]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][38] ([i915#17342])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk11:        NOTRUN -> [SKIP][39] ([i915#17496])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#280]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([i915#17496]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [PASS][43] -> [INCOMPLETE][44] ([i915#17190])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-6/igt@gem_eio@in-flight-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@full:
    - shard-snb:          NOTRUN -> [SKIP][45] ([i915#17587])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@gem_exec_balancer@full.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-glk:          NOTRUN -> [SKIP][46] ([i915#17547]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@gem_exec_balancer@parallel-contexts.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4525]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#4525])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][49] ([i915#15816])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#6334]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk10:        NOTRUN -> [SKIP][51] ([i915#17711])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][52] ([i915#16904]) +4 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][54] ([i915#17599]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gem_exec_flush@basic-uc-pro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3539])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-glk10:        NOTRUN -> [SKIP][58] ([i915#17565])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#17453])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#17416])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_exec_params@secure-non-master.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#17416])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gem_exec_params@secure-non-master.html
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#17416])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_exec_params@secure-non-master.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#17416]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_exec_params@secure-non-master.html
    - shard-snb:          NOTRUN -> [SKIP][64] ([i915#17523])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@gem_exec_params@secure-non-master.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#17416])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@gem_exec_params@secure-non-master.html
    - shard-glk:          NOTRUN -> [SKIP][66] ([i915#17523])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3281]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#3281]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3281]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#14544] / [i915#3281])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3281]) +14 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4812]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4537] / [i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4537] / [i915#4812])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@preempt-user:
    - shard-snb:          NOTRUN -> [SKIP][75] ([i915#17590]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@gem_exec_schedule@preempt-user.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][76] -> [INCOMPLETE][77] ([i915#13356]) +2 other tests incomplete
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4860]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_gtt_cpu_tlb:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4077]) +17 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@gem_gtt_cpu_tlb.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#17605] / [i915#4613])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4613] / [i915#7582])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-snb:          NOTRUN -> [SKIP][82] ([i915#17605])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#4613] / [i915#7582])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][84] ([i915#4613]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#4613]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_lmem_swapping@parallel-multi.html
    - shard-snb:          NOTRUN -> [SKIP][86] ([i915#17503])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4613]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_lmem_swapping@parallel-multi.html
    - shard-glk11:        NOTRUN -> [SKIP][88] ([i915#17503])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#4613]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#17503] / [i915#4613]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk10:        NOTRUN -> [SKIP][91] ([i915#17503]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#12193]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4565]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3282]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4077]) +10 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4077]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4083]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@gem_mmap_wc@write-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#4083])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_mmap_wc@write-read.html
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4083])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#3282]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3282]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][102] ([i915#2658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_pread@exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][103] ([i915#2658])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3282]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4270]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#13717])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#13398]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-glk:          NOTRUN -> [SKIP][108] ([i915#17521]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4270]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-glk10:        NOTRUN -> [SKIP][110] ([i915#17521]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-snb:          NOTRUN -> [SKIP][111] ([i915#17521]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8428]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][113] ([i915#17492])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][114] ([i915#17492])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][115] ([i915#17492]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#5190] / [i915#8428]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@gem_render_copy@yf-tiled.html
    - shard-snb:          NOTRUN -> [SKIP][117] ([i915#17591]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-glk:          NOTRUN -> [SKIP][118] ([i915#17492]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4079])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#8411])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#4079])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4079]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4879])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3297]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#3297]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#3297] / [i915#4880])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#3297] / [i915#4880]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#3297]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#3297]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-glk11:        NOTRUN -> [SKIP][130] ([i915#17507])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-glk:          NOTRUN -> [SKIP][131] ([i915#17507])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_userptr_blits@readonly-unsync.html
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#3297]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_userptr_blits@readonly-unsync.html
    - shard-snb:          NOTRUN -> [SKIP][133] ([i915#17507])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3297]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-glk10:        NOTRUN -> [SKIP][135] ([i915#17507])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][136] ([i915#13356] / [i915#14586])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#13356] / [i915#14586])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_linear_blits:
    - shard-glk:          NOTRUN -> [SKIP][138] ([i915#17555])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gen3_render_linear_blits.html

  * igt@gen3_render_mixed_blits:
    - shard-glk11:        NOTRUN -> [SKIP][139] ([i915#17532])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gen3_render_mixed_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk:          NOTRUN -> [SKIP][140] ([i915#17511])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@gen3_render_tiledx_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk:          NOTRUN -> [SKIP][141] ([i915#17578])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-glk11:        NOTRUN -> [SKIP][142] ([i915#17505])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#17455]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#17455])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-glk:          NOTRUN -> [SKIP][145] ([i915#17505]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#17455])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gen7_exec_parse@cmd-crossing-page.html
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#17455]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-glk10:        NOTRUN -> [SKIP][148] ([i915#17505])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#2527] / [i915#2856])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#2527]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html
    - shard-glk:          NOTRUN -> [SKIP][151] ([i915#16871]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#2856]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gen9_exec_parse@bb-start-param.html
    - shard-snb:          NOTRUN -> [SKIP][153] ([i915#17597]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#2527] / [i915#2856]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#2856]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#2527]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#14123])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#14123])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#14123])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#11527]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#14073]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#14073]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@memory-info-active:
    - shard-snb:          NOTRUN -> [SKIP][163] ([i915#17603])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@i915_drm_fdinfo@memory-info-active.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#14118])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#14118])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@i915_drm_fdinfo@virtual-busy-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#14118])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#13786])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-glk11:        NOTRUN -> [SKIP][168] ([i915#17580])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][169] ([i915#17610])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#15479]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][171] ([i915#15342]) +1 other test abort
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-glk:          NOTRUN -> [ABORT][172] ([i915#15342]) +1 other test abort
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_gt_init-enodev:
    - shard-glk:          NOTRUN -> [SKIP][173] ([i915#17600]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-glk:          NOTRUN -> [SKIP][174] ([i915#17526]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#8399])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-snb:          NOTRUN -> [SKIP][176] ([i915#17526])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#8399]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#16080] / [i915#16166])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][179] ([i915#13790] / [i915#2681]) +1 other test warn
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#14498])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#14498])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][182] ([i915#17706])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#17434] / [i915#17450])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#11681] / [i915#6621]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#11681])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#4387])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#4387])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@i915_pm_sseu@full-enable.html
    - shard-snb:          NOTRUN -> [SKIP][188] ([i915#17619])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#4387])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8437])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#6188])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#16109])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html
    - shard-glk11:        NOTRUN -> [SKIP][193] ([i915#17574])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-glk:          NOTRUN -> [SKIP][194] ([i915#17563])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@i915_query@query-topology-unsupported.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#16079])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#5723])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html
    - shard-glk11:        NOTRUN -> [SKIP][197] ([i915#17673])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][198] ([i915#13356] / [i915#16182] / [i915#4817])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@i915_suspend@debugfs-reader.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][199] ([i915#4817])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-mtlp:         [PASS][200] -> [FAIL][201] ([i915#17170] / [i915#17171])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-1/igt@i915_suspend@sysfs-reader.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-glk:          NOTRUN -> [SKIP][202] ([i915#11680])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#4212]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#4212]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-glk10:        NOTRUN -> [SKIP][205] ([i915#17668])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#4212]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][207] ([i915#12761]) +1 other test incomplete
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-glk:          NOTRUN -> [SKIP][208] ([i915#17562]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-glk:          NOTRUN -> [SKIP][209] ([i915#17485])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#9531])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#9531])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#9531])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#1769] / [i915#3555])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][214] ([i915#1769])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#17432] / [i915#5286]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#4538] / [i915#5286]) +10 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][217] ([i915#17478]) +15 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#17431]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#4538] / [i915#5286]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#5286])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-glk11:        NOTRUN -> [SKIP][221] ([i915#17544])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#17432] / [i915#5286]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17478]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#17431] / [i915#3638]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#17431]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#17431]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk11:        NOTRUN -> [SKIP][227] ([i915#17524])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#3828]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3828])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][230] ([i915#17524])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#3638]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-snb:          NOTRUN -> [SKIP][232] ([i915#17630])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#17431]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#4538] / [i915#5190]) +9 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][235] ([i915#17500]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#4538]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-glk10:        NOTRUN -> [SKIP][237] ([i915#17500])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#17356] / [i915#5190])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#17432])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#4538]) +10 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-snb:          NOTRUN -> [SKIP][241] ([i915#17478]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#17432]) +9 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#14544] / [i915#4538])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#17432]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][245] ([i915#17500]) +15 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][246] ([i915#17478]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#17432]) +8 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][248] -> [DMESG-WARN][249] ([i915#13363])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-rkl:          [PASS][250] -> [DMESG-WARN][251] ([i915#17147])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][252] ([i915#17491]) +138 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#14544] / [i915#6095]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#14098] / [i915#14544] / [i915#6095])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][255] ([i915#17491]) +18 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][256] ([i915#17490] / [i915#17491]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#17490] / [i915#17491]) +53 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#12313])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#12313] / [i915#14544])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#12313]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][261] ([i915#17491]) +33 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#17356]) +9 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
    - shard-snb:          NOTRUN -> [SKIP][263] ([i915#17594]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#6095]) +19 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#12313]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-glk10:        NOTRUN -> [SKIP][266] ([i915#17525])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [PASS][267] -> [SKIP][268] ([i915#17356]) +29 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#12313]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#10307] / [i915#6095]) +111 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#6095]) +149 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#6095]) +49 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][274] ([i915#17525]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][275] ([i915#15582])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         [PASS][276] -> [FAIL][277] ([i915#17158])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         [PASS][278] -> [INCOMPLETE][279] ([i915#15582]) +1 other test incomplete
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#6095]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#6095]) +104 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#14098] / [i915#6095]) +34 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#6095]) +53 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][284] ([i915#17490] / [i915#17491]) +5 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#12313])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#12313]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][287] ([i915#17525]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#17099])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#3742]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#13781]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-glk:          NOTRUN -> [SKIP][291] ([i915#17550])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#11151] / [i915#7828]) +13 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#11151] / [i915#7828]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-glk10:        NOTRUN -> [SKIP][294] ([i915#17489])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#17427]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk:          NOTRUN -> [SKIP][296] ([i915#17489])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_chamelium_color@ctm-negative.html
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#17427]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@gamma:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#17427]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_chamelium_color@gamma.html
    - shard-glk11:        NOTRUN -> [SKIP][299] ([i915#17489])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#17427])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#17427]) +5 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-glk11:        NOTRUN -> [SKIP][302] ([i915#17497]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#17427]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#16471] / [i915#17427])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#16471] / [i915#17427]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][306] ([i915#17497]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_chamelium_color_pipeline@plane-lut1d.html
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#16464] / [i915#16471] / [i915#17427])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html
    - shard-glk10:        NOTRUN -> [SKIP][308] ([i915#17497])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][309] ([i915#17497]) +5 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#16471] / [i915#17427]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#16471] / [i915#17427]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#11151] / [i915#7828]) +7 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#11151] / [i915#7828]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#11151] / [i915#7828]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-snb:          NOTRUN -> [SKIP][315] ([i915#17483]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][316] ([i915#17483]) +12 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#11151])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#11151] / [i915#7828]) +14 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#11151])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][320] ([i915#17483]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-glk10:        NOTRUN -> [SKIP][321] ([i915#17483]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_color@background-color@pipe-a-background-color:
    - shard-glk11:        NOTRUN -> [FAIL][322] ([i915#17133]) +3 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_color@background-color@pipe-a-background-color.html

  * igt@kms_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#12655] / [i915#17373])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color@ctm-green-to-red.html

  * igt@kms_color@deep-color:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#12655] / [i915#3555])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_color@deep-color.html
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#3555] / [i915#9979])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_color@deep-color.html
    - shard-glk:          NOTRUN -> [SKIP][326] ([i915#17640])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_color@deep-color.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-dg2:          [PASS][327] -> [SKIP][328] ([i915#12655] / [i915#17373])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_color@legacy-gamma-reset.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-snb:          NOTRUN -> [SKIP][329] ([i915#17510]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#15529])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:
    - shard-dg2:          [PASS][331] -> [SKIP][332] ([i915#15529]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][333] ([i915#17510]) +7 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#16990]) +23 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#16990]) +15 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#16990]) +15 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#16990]) +31 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#16990]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#16990]) +23 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#15865]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#15865]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#15865]) +4 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-glk10:        NOTRUN -> [SKIP][343] ([i915#17508])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#15865]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-glk11:        NOTRUN -> [SKIP][345] ([i915#17502])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#15330] / [i915#3299])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#15330])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][348] ([i915#15330])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#15330])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#15330])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-snb:          NOTRUN -> [SKIP][351] ([i915#17502])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#15330])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#15330])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][354] ([i915#17502]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][355] ([i915#17508]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#17508]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][357] ([i915#15865]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_content_protection@type1.html
    - shard-glk11:        NOTRUN -> [SKIP][358] ([i915#17508]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#13049] / [i915#3359]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][360] ([i915#13049])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-snb:          NOTRUN -> [SKIP][361] ([i915#17533]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#13049]) +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-glk11:        NOTRUN -> [SKIP][363] ([i915#17533])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         NOTRUN -> [FAIL][364] ([i915#13566]) +1 other test fail
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#3555]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][366] -> [FAIL][367] ([i915#13566]) +1 other test fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-9/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#3555]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-snb:          NOTRUN -> [SKIP][369] ([i915#17504])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#3555] / [i915#8814])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-glk10:        NOTRUN -> [SKIP][371] ([i915#17504]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#13049]) +3 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][373] ([i915#3555]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#13049]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][375] ([i915#13566]) +1 other test fail
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-glk:          NOTRUN -> [SKIP][376] ([i915#17533]) +4 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#13049]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][378] ([i915#13566]) +2 other tests fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#17428] / [i915#17454]) +9 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#17428] / [i915#9809]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#4103]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][382] ([i915#17428] / [i915#17454]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][384] ([i915#9067])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-glk:          NOTRUN -> [SKIP][385] ([i915#17457]) +3 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#4103])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][387] ([i915#9723])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-glk:          NOTRUN -> [SKIP][388] ([i915#17515])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#9723])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#9723])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#13691])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#13691])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#13691])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_display_modes@extended-mode-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#13691])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][395] ([i915#13691])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#3555] / [i915#3804])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][397] ([i915#1769] / [i915#3555] / [i915#3804])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#3804])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#3804])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#17289])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#17289])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][402] ([i915#17519])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#17287])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-glk:          NOTRUN -> [SKIP][404] ([i915#17664])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][405] ([i915#17506])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#17286])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#17286])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#17286])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-glk:          NOTRUN -> [SKIP][409] ([i915#17477]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_dp_link_training@uhbr-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#13748])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#17285]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][412] ([i915#13748])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-dg2:          NOTRUN -> [SKIP][413] ([i915#17285])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][414] ([i915#17285])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-glk:          NOTRUN -> [SKIP][415] ([i915#17625])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#13707])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][417] ([i915#16870])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#16361]) +9 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-snb:          NOTRUN -> [SKIP][419] ([i915#17458]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][420] ([i915#16361])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-glk:          NOTRUN -> [SKIP][421] ([i915#17458]) +8 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-glk10:        NOTRUN -> [SKIP][422] ([i915#17458])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][423] ([i915#16361]) +7 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][424] ([i915#16361]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#16361]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][426] ([i915#16361]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-mtlp:         [PASS][427] -> [FAIL][428] ([i915#17189] / [i915#17349])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][429] ([i915#16680])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#16680])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][431] ([i915#16084])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][432] ([i915#16081])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-glk10:        NOTRUN -> [SKIP][433] ([i915#17570])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-tglu-1:       NOTRUN -> [SKIP][434] ([i915#16600])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-glk:          NOTRUN -> [SKIP][435] ([i915#17539])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][436] ([i915#16600])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][437] ([i915#16600])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_feature_discovery@vrr.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][438] ([i915#4881])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][439] ([i915#9934])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#8381]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][441] ([i915#8381])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][442] ([i915#9934]) +5 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#9934]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][444] ([i915#3637] / [i915#9934]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][445] ([i915#9934]) +7 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][446] ([i915#3637] / [i915#9934]) +9 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][447] ([i915#3637] / [i915#9934]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][448] ([i915#10826]) +1 other test fail
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#5354]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [PASS][450] -> [SKIP][451] ([i915#5354]) +3 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@kms_flip@flip-vs-suspend.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html
    - shard-mtlp:         [PASS][452] -> [FAIL][453] ([i915#17214]) +1 other test fail
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@kms_flip@flip-vs-suspend.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][454] ([i915#17484]) +3 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-glk11:        NOTRUN -> [SKIP][455] ([i915#17484]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][456] ([i915#17522]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][457] ([i915#15643]) +5 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][458] ([i915#15643]) +3 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][459] ([i915#15643])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#3555] / [i915#8813])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-snb:          NOTRUN -> [SKIP][461] ([i915#17593]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][462] ([i915#15643]) +7 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][463] ([i915#15643]) +3 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][464] ([i915#17493]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][465] ([i915#15643] / [i915#5190]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-dg2:          [PASS][466] -> [SKIP][467] ([i915#8813])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
    - shard-tglu-1:       NOTRUN -> [SKIP][468] ([i915#15643])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-mtlp:         [PASS][469] -> [SKIP][470] ([i915#15672])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-2/igt@kms_force_connector_basic@force-edid.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-glk:          NOTRUN -> [SKIP][471] ([i915#17465])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][472] ([i915#16708] / [i915#5354]) +8 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][473] -> [SKIP][474] ([i915#16708] / [i915#5354]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][475] ([i915#17428] / [i915#1825]) +4 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][476] ([i915#17428]) +100 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][477] ([i915#15990] / [i915#8708]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][478] ([i915#15990] / [i915#8708]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][479] -> [INCOMPLETE][480] ([i915#10056])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][481] ([i915#10056] / [i915#13356] / [i915#16593])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][482] ([i915#17559])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][483] ([i915#17517]) +56 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][484] ([i915#15990]) +8 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk11:        NOTRUN -> [SKIP][485] ([i915#17517]) +6 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][486] ([i915#15991] / [i915#17428]) +21 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][487] ([i915#17428]) +121 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move:
    - shard-glk:          [PASS][488] -> [SKIP][489] ([i915#17517]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][490] ([i915#15989]) +9 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-rkl:          [PASS][491] -> [SKIP][492] ([i915#15989]) +5 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][493] ([i915#15989]) +28 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html
    - shard-snb:          NOTRUN -> [SKIP][494] ([i915#17588]) +28 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][495] ([i915#15989]) +32 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][496] ([i915#15104] / [i915#15990])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][497] ([i915#15990] / [i915#8708]) +26 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][498] ([i915#17482]) +41 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][499] ([i915#15991] / [i915#5354]) +22 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][500] ([i915#14544] / [i915#17428] / [i915#1825])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][501] ([i915#17482]) +163 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][502] ([i915#15102]) +28 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][503] ([i915#15102]) +62 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][504] ([i915#15102]) +38 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][505] ([i915#15990]) +12 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][506] ([i915#15102]) +43 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][507] ([i915#15990]) +32 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk10:        NOTRUN -> [SKIP][508] ([i915#17482]) +36 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][509] ([i915#15991]) +22 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][510] ([i915#5439])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][511] ([i915#5439]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][512] ([i915#17517]) +9 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][513] ([i915#15989]) +19 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][514] ([i915#15989]) +15 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][515] ([i915#16708]) +10 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][516] ([i915#17428]) +58 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt:
    - shard-glk11:        [PASS][517] -> [SKIP][518] ([i915#17517]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][519] ([i915#14544] / [i915#17428]) +3 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][520] ([i915#15102]) +15 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][521] ([i915#15104] / [i915#15990]) +2 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][522] ([i915#15991] / [i915#17428] / [i915#1825]) +18 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][523] ([i915#17482]) +14 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-mtlp:         [PASS][524] -> [FAIL][525] ([i915#17276])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][526] ([i915#14544] / [i915#15102]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][527] ([i915#15989]) +20 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][528] ([i915#17428]) +76 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk:          NOTRUN -> [FAIL][529] ([i915#17102])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-dg2:          [PASS][530] -> [SKIP][531] ([i915#17357]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          NOTRUN -> [ABORT][532] ([i915#15132]) +1 other test abort
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-glk11:        NOTRUN -> [FAIL][533] ([i915#17101] / [i915#17108])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][534] ([i915#16518] / [i915#3555] / [i915#8228]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][535] ([i915#3555] / [i915#8228]) +3 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][536] ([i915#16644] / [i915#3555] / [i915#8228])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][537] ([i915#17498])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][538] ([i915#12713])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][539] ([i915#3555] / [i915#8228]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-glk:          NOTRUN -> [SKIP][540] ([i915#17498])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_hdr@static-swap.html
    - shard-rkl:          [PASS][541] -> [SKIP][542] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_hdr@static-swap.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-glk10:        NOTRUN -> [SKIP][543] ([i915#17498])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][544] ([i915#17498])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][545] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-dg2:          [PASS][546] -> [SKIP][547] ([i915#16746] / [i915#3555]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_invalid_mode@bad-hsync-start.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][548] ([i915#15458])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][549] ([i915#13688])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-3/igt@kms_joiner@basic-max-non-joiner.html
    - shard-glk:          NOTRUN -> [SKIP][550] ([i915#17575])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][551] ([i915#17567])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][552] ([i915#15458])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][553] ([i915#15460])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][554] ([i915#15458]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][555] ([i915#6301])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu:         NOTRUN -> [SKIP][556] ([i915#17455]) +5 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
    - shard-glk:          NOTRUN -> [SKIP][557] ([i915#17540])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][558] ([i915#17455])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][559] ([i915#17540])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2:          [PASS][560] -> [SKIP][561] ([i915#11190] / [i915#17356]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][562] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][563] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#16789])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][564] ([i915#118])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][565] ([i915#15709]) +7 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-dg2:          [PASS][566] -> [SKIP][567] ([i915#8825]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][568] ([i915#17479]) +5 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][569] ([i915#16386]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][570] ([i915#15709]) +4 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][571] ([i915#15709]) +2 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-snb:          NOTRUN -> [SKIP][572] ([i915#17479])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][573] ([i915#15709]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
    - shard-glk10:        NOTRUN -> [SKIP][574] ([i915#17479])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-glk11:        NOTRUN -> [SKIP][575] ([i915#17479])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][576] ([i915#16386]) +3 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][577] ([i915#15709]) +1 other test skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][578] ([i915#15709]) +5 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][579] ([i915#14544] / [i915#15709])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][580] ([i915#17494]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-glk11:        NOTRUN -> [SKIP][581] ([i915#17700])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-rkl:          NOTRUN -> [SKIP][582] ([i915#16112])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][583] ([i915#10647] / [i915#12169])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][584] ([i915#10647]) +1 other test fail
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-mtlp:         [PASS][585] -> [FAIL][586] ([i915#15733]) +2 other tests fail
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_plane_alpha_blend@coverage-7efc.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-glk11:        NOTRUN -> [SKIP][587] ([i915#17509])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][588] ([i915#13958]) +1 other test skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][589] ([i915#13958])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-glk:          NOTRUN -> [SKIP][590] ([i915#17586])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][591] ([i915#17542])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-snb:          NOTRUN -> [SKIP][592] ([i915#17542])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@kms_plane_multiple@tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][593] ([i915#14259])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][594] ([i915#14259])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][595] ([i915#14259]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-snb:          NOTRUN -> [SKIP][596] ([i915#17528]) +3 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_plane_scaling@invalid-num-scalers.html
    - shard-dg2:          NOTRUN -> [SKIP][597] ([i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-glk10:        NOTRUN -> [SKIP][598] ([i915#17529]) +1 other test skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][599] ([i915#17528]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][600] ([i915#17528]) +5 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-dg2:          [PASS][601] -> [SKIP][602] ([i915#15329] / [i915#17356] / [i915#9423])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:
    - shard-dg2:          [PASS][603] -> [SKIP][604] ([i915#15329] / [i915#17356]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][605] ([i915#15329] / [i915#3555])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][606] ([i915#15329] / [i915#3555])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu:         NOTRUN -> [SKIP][607] ([i915#15329] / [i915#3555])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][608] ([i915#17529]) +5 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-snb:          NOTRUN -> [SKIP][609] ([i915#17528] / [i915#17529])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][610] ([i915#15329]) +3 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][611] ([i915#15329]) +6 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][612] ([i915#15329]) +8 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [PASS][613] -> [SKIP][614] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-dg2:          [PASS][615] -> [SKIP][616] ([i915#15329]) +5 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][617] ([i915#15329] / [i915#6953])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][618] ([i915#17529]) +1 other test skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][619] ([i915#15329]) +5 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][620] ([i915#12343] / [i915#5354])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_pm_backlight@bad-brightness.html
    - shard-rkl:          NOTRUN -> [SKIP][621] ([i915#12343] / [i915#5354])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk:          NOTRUN -> [SKIP][622] ([i915#17462]) +1 other test skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][623] ([i915#12343])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][624] ([i915#12343])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][625] ([i915#12343] / [i915#9812])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][626] ([i915#12343] / [i915#5354])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][627] ([i915#13356] / [i915#16938])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-glk:          NOTRUN -> [SKIP][628] ([i915#17495])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][629] ([i915#14544] / [i915#9685])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-glk11:        NOTRUN -> [SKIP][630] ([i915#17564])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][631] ([i915#16914])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][632] ([i915#3828])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][633] ([i915#3361])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk:          NOTRUN -> [SKIP][634] ([i915#17564])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][635] ([i915#15948]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][636] ([i915#15948]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-snb:          NOTRUN -> [SKIP][637] ([i915#17602]) +1 other test skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][638] ([i915#15948]) +1 other test skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][639] ([i915#15948]) +1 other test skip
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][640] ([i915#15739])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][641] ([i915#15073])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-rkl:          [PASS][642] -> [SKIP][643] ([i915#15073])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][644] -> [DMESG-WARN][645] ([i915#4423])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-16/igt@kms_pm_rpm@i2c.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][646] ([i915#14544] / [i915#15073])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-glk11:        NOTRUN -> [SKIP][647] ([i915#15073])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][648] ([i915#15073])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][649] ([i915#15073])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu:         NOTRUN -> [SKIP][650] ([i915#15403])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][651] ([i915#17434] / [i915#17450])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_pm_rpm@pc8-residency.html
    - shard-glk11:        NOTRUN -> [SKIP][652] ([i915#17710])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][653] ([i915#6524])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][654] ([i915#6524])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk:          NOTRUN -> [SKIP][655] ([i915#17481])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][656] ([i915#11520]) +3 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][657] ([i915#11520]) +5 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][658] ([i915#11520]) +6 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][659] ([i915#11520]) +8 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][660] ([i915#9808]) +1 other test skip
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][661] ([i915#12316]) +6 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][662] ([i915#11520]) +11 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][663] ([i915#11520]) +12 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][664] ([i915#11520]) +1 other test skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][665] ([i915#11520]) +3 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg1:          NOTRUN -> [SKIP][666] ([i915#11520]) +11 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][667] ([i915#17546]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][668] ([i915#9683])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][669] ([i915#9683])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-glk11:        NOTRUN -> [SKIP][670] ([i915#17480]) +8 other tests skip
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-glk10:        NOTRUN -> [SKIP][671] ([i915#17480]) +5 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][672] ([i915#9732]) +28 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][673] ([i915#9688]) +8 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@pr-basic:
    - shard-glk:          NOTRUN -> [SKIP][674] ([i915#17480]) +35 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][675] ([i915#9732]) +12 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-render:
    - shard-dg2:          NOTRUN -> [SKIP][676] ([i915#1072] / [i915#9732]) +14 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          NOTRUN -> [SKIP][677] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][678] ([i915#17480] / [i915#9732])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-suspend:
    - shard-mtlp:         [PASS][679] -> [FAIL][680] ([i915#17226]) +1 other test fail
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-8/igt@kms_psr@psr-suspend.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][681] ([i915#1072] / [i915#9732]) +15 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_psr@psr2-sprite-mmap-cpu.html
    - shard-snb:          NOTRUN -> [SKIP][682] ([i915#17480]) +5 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][683] ([i915#1072] / [i915#9732]) +31 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][684] ([i915#15949])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][685] ([i915#15867]) +4 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][686] ([i915#5289])
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][687] ([i915#5289])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][688] ([i915#17488]) +3 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][689] ([i915#12755] / [i915#15867] / [i915#5190])
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][690] ([i915#17432] / [i915#5289]) +1 other test skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-snb:          NOTRUN -> [SKIP][691] ([i915#17488]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu-1:       NOTRUN -> [SKIP][692] ([i915#17432] / [i915#5289])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][693] ([i915#17432] / [i915#5289])
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][694] ([i915#12755] / [i915#15867])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          NOTRUN -> [SKIP][695] ([i915#3555]) +3 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-glk10:        NOTRUN -> [SKIP][696] ([i915#17501])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - shard-glk:          [PASS][697] -> [ABORT][698] ([i915#13179])
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][699] ([i915#3555]) +6 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk:          NOTRUN -> [SKIP][700] ([i915#17463])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][701] ([i915#8623])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][702] ([i915#8623])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][703] ([i915#17558])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_tv_load_detect@load-detect.html
    - shard-tglu:         NOTRUN -> [SKIP][704] ([i915#17445])
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_tv_load_detect@load-detect.html
    - shard-mtlp:         NOTRUN -> [SKIP][705] ([i915#17445])
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html
    - shard-dg2:          NOTRUN -> [SKIP][706] ([i915#17445])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_tv_load_detect@load-detect.html
    - shard-dg1:          NOTRUN -> [SKIP][707] ([i915#17445])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][708] -> [ABORT][709] ([i915#15132])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][710] -> [INCOMPLETE][711] ([i915#12276] / [i915#13356])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@negative-basic:
    - shard-glk:          NOTRUN -> [SKIP][712] ([i915#17520]) +3 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][713] ([i915#3555] / [i915#9906])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-glk11:        NOTRUN -> [SKIP][714] ([i915#17520]) +1 other test skip
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][715] ([i915#9906]) +1 other test skip
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][716] ([i915#9906])
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][717] ([i915#9906]) +1 other test skip
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@blocking-parameterized:
    - shard-snb:          NOTRUN -> [SKIP][718] ([i915#17592]) +1 other test skip
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-glk:          NOTRUN -> [SKIP][719] ([i915#17536]) +1 other test skip
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-glk10:        NOTRUN -> [SKIP][720] ([i915#17536])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][721] ([i915#2436])
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-idle@bcs0:
    - shard-mtlp:         [PASS][722] -> [FAIL][723] ([i915#4349]) +5 other tests fail
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@perf_pmu@busy-idle@bcs0.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@perf_pmu@busy-idle@bcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglu:         NOTRUN -> [SKIP][724] ([i915#17416]) +1 other test skip
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-glk11:        NOTRUN -> [FAIL][725] ([i915#17119])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][726] -> [FAIL][727] ([i915#15997]) +1 other test fail
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-mtlp:         [PASS][728] -> [FAIL][729] ([i915#15997]) +1 other test fail
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-glk:          NOTRUN -> [SKIP][730] ([i915#17583])
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk10:        NOTRUN -> [SKIP][731] ([i915#17583])
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          NOTRUN -> [FAIL][732] ([i915#4349]) +3 other tests fail
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][733] ([i915#14121]) +1 other test skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_udl@share-import:
    - shard-rkl:          NOTRUN -> [SKIP][734] ([i915#16420])
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@prime_udl@share-import.html
    - shard-tglu-1:       NOTRUN -> [SKIP][735] ([i915#16420]) +1 other test skip
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][736] ([i915#3708])
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][737] ([i915#17448] / [i915#3291] / [i915#3708])
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][738] ([i915#3708] / [i915#4077])
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@prime_vgem@coherency-gtt.html
    - shard-tglu-1:       NOTRUN -> [SKIP][739] ([i915#17429] / [i915#17448])
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk11:        NOTRUN -> [SKIP][740] ([i915#17467])
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][741] ([i915#17448]) +1 other test skip
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][742] ([i915#3708])
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_timeslice_duration@duration@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][743] ([i915#17632]) +3 other tests skip
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@sysfs_timeslice_duration@duration@vcs0.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-block:
    - shard-dg2:          [SKIP][744] ([i915#17359]) -> [PASS][745] +2 other tests pass
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@drm_read@short-buffer-block.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@drm_read@short-buffer-block.html

  * igt@fbdev@info:
    - shard-dg2:          [SKIP][746] ([i915#1849] / [i915#2582]) -> [PASS][747]
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@fbdev@info.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2:          [FAIL][748] -> [PASS][749]
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@fbdev@read.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@fbdev@read.html
    - shard-dg1:          [FAIL][750] -> [PASS][751]
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-16/igt@fbdev@read.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@fbdev@read.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][752] ([i915#13356] / [i915#16348]) -> [PASS][753]
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][754] ([i915#13356]) -> [PASS][755] +1 other test pass
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][756] ([i915#5566]) -> [PASS][757]
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk6/igt@gen9_exec_parse@allowed-single.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-dg2:          [SKIP][758] -> [PASS][759]
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@i915_pm_rpm@debugfs-read.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         [FAIL][760] ([i915#15365]) -> [PASS][761]
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@i915_pm_rps@reset.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [DMESG-WARN][762] ([i915#14545]) -> [PASS][763]
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@i915_suspend@basic-s3-without-i915.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][764] ([i915#15662]) -> [PASS][765] +1 other test pass
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_busy@basic:
    - shard-dg2:          [SKIP][766] ([i915#11190] / [i915#17356]) -> [PASS][767] +2 other tests pass
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_busy@basic.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_busy@basic.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][768] ([i915#17158]) -> [PASS][769] +1 other test pass
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][770] ([i915#15582]) -> [PASS][771] +1 other test pass
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][772] ([i915#15582]) -> [PASS][773] +2 other tests pass
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2:          [SKIP][774] ([i915#12655] / [i915#17373]) -> [PASS][775] +2 other tests pass
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_color@ctm-0-75.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_color@ctm-0-75.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-dg2:          [SKIP][776] ([i915#15529]) -> [PASS][777] +2 other tests pass
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][778] ([i915#13566]) -> [PASS][779] +3 other tests pass
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][780] ([i915#13566]) -> [PASS][781] +2 other tests pass
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-mtlp:         [FAIL][782] ([i915#17189] / [i915#17349]) -> [PASS][783]
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-dg2:          [SKIP][784] ([i915#9738]) -> [PASS][785]
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_feature_discovery@display-1x.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-glk:          [FAIL][786] ([i915#14600]) -> [PASS][787] +1 other test pass
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk4/igt@kms_flip@blocking-wf_vblank.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [SKIP][788] ([i915#5354]) -> [PASS][789] +5 other tests pass
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2:          [SKIP][790] ([i915#3555] / [i915#8813]) -> [PASS][791] +2 other tests pass
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [SKIP][792] ([i915#15672]) -> [PASS][793]
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][794] ([i915#16708]) -> [PASS][795] +1 other test pass
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][796] ([i915#16708] / [i915#5354]) -> [PASS][797] +8 other tests pass
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][798] ([i915#15989]) -> [PASS][799] +2 other tests pass
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:
    - shard-glk:          [SKIP][800] ([i915#17517]) -> [PASS][801] +6 other tests pass
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk9/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          [SKIP][802] ([i915#16746] / [i915#3555]) -> [PASS][803] +1 other test pass
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_invalid_mode@zero-hdisplay.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][804] ([i915#15329] / [i915#17356]) -> [PASS][805] +6 other tests pass
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2:          [SKIP][806] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][807] +3 other tests pass
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - shard-dg2:          [SKIP][808] ([i915#15329]) -> [PASS][809] +20 other tests pass
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2:          [SKIP][810] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][811]
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [SKIP][812] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) -> [PASS][813]
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [SKIP][814] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][815]
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [SKIP][816] ([i915#13441]) -> [PASS][817]
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-mtlp:         [FAIL][818] ([i915#17173]) -> [PASS][819]
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [DMESG-WARN][820] ([i915#4423]) -> [PASS][821]
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][822] ([i915#15073]) -> [PASS][823]
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][824] ([i915#15073]) -> [PASS][825]
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [SKIP][826] ([i915#9519]) -> [PASS][827]
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html
    - shard-rkl:          [INCOMPLETE][828] ([i915#14419]) -> [PASS][829]
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [INCOMPLETE][830] ([i915#12276]) -> [PASS][831]
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@wait-idle-hang:
    - shard-dg2:          [SKIP][832] ([i915#17356]) -> [PASS][833] +43 other tests pass
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_vblank@wait-idle-hang.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_vblank@wait-idle-hang.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [FAIL][834] ([i915#4349]) -> [PASS][835]
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][836] ([i915#14544] / [i915#8411]) -> [SKIP][837] ([i915#8411])
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][838] ([i915#7697]) -> [SKIP][839] ([i915#14544] / [i915#7697])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-7/igt@gem_basic@multigpu-create-close.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][840] ([i915#13008]) -> [SKIP][841] ([i915#13008] / [i915#14544])
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][842] ([i915#14544] / [i915#4525]) -> [SKIP][843] ([i915#4525])
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-rkl:          [SKIP][844] ([i915#3281]) -> [SKIP][845] ([i915#14544] / [i915#3281]) +1 other test skip
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@gem_exec_reloc@basic-concurrent16.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][846] ([i915#14544] / [i915#3281]) -> [SKIP][847] ([i915#3281]) +3 other tests skip
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][848] ([i915#7276]) -> [SKIP][849] ([i915#14544] / [i915#7276])
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          [SKIP][850] ([i915#4613]) -> [SKIP][851] ([i915#14544] / [i915#4613])
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@gem_lmem_swapping@heavy-multi.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          [SKIP][852] ([i915#14544] / [i915#4613]) -> [SKIP][853] ([i915#4613])
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][854] ([i915#14544] / [i915#3282]) -> [SKIP][855] ([i915#3282]) +2 other tests skip
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][856] ([i915#14544] / [i915#3297]) -> [SKIP][857] ([i915#3297]) +1 other test skip
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][858] ([i915#3282] / [i915#3297]) -> [SKIP][859] ([i915#14544] / [i915#3282] / [i915#3297])
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          [SKIP][860] ([i915#17455]) -> [SKIP][861] ([i915#14544] / [i915#17455]) +1 other test skip
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@gen7_exec_parse@bitmasks.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][862] ([i915#14544] / [i915#2527]) -> [SKIP][863] ([i915#2527])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-rkl:          [SKIP][864] ([i915#2527]) -> [SKIP][865] ([i915#14544] / [i915#2527])
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gen9_exec_parse@batch-zero-length.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][866] ([i915#14544] / [i915#8399]) -> [SKIP][867] ([i915#8399])
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][868] ([i915#12454] / [i915#12712] / [i915#14544]) -> [SKIP][869] ([i915#12454] / [i915#12712])
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][870] ([i915#17356]) -> [SKIP][871] ([i915#9531])
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][872] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][873] ([i915#1769] / [i915#3555])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][874] ([i915#17431]) -> [SKIP][875] ([i915#17356]) +1 other test skip
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-rkl:          [SKIP][876] ([i915#4538] / [i915#5286]) -> [SKIP][877] ([i915#14544] / [i915#4538] / [i915#5286]) +1 other test skip
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-rkl:          [SKIP][878] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][879] ([i915#4538] / [i915#5286]) +1 other test skip
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][880] ([i915#17356]) -> [SKIP][881] ([i915#17431]) +6 other tests skip
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][882] ([i915#4538] / [i915#5190]) -> [SKIP][883] ([i915#17356] / [i915#5190]) +6 other tests skip
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][884] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][885] ([i915#17431] / [i915#3638]) +1 other test skip
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][886] ([i915#17356] / [i915#5190]) -> [SKIP][887] ([i915#5190]) +1 other test skip
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][888] ([i915#17356] / [i915#5190]) -> [SKIP][889] ([i915#4538] / [i915#5190]) +10 other tests skip
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][890] ([i915#14544] / [i915#4538]) -> [SKIP][891] ([i915#4538]) +1 other test skip
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][892] ([i915#14098] / [i915#6095]) -> [SKIP][893] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][894] ([i915#12313]) -> [SKIP][895] ([i915#17356])
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          [SKIP][896] ([i915#12313] / [i915#14544]) -> [SKIP][897] ([i915#12313])
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2:          [SKIP][898] ([i915#17356]) -> [SKIP][899] ([i915#10307] / [i915#6095]) +13 other tests skip
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][900] ([i915#17356]) -> [SKIP][901] ([i915#12313]) +2 other tests skip
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][902] ([i915#15582]) -> [FAIL][903] ([i915#17158])
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-rkl:          [SKIP][904] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][905] ([i915#14098] / [i915#6095]) +6 other tests skip
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][906] ([i915#6095]) -> [SKIP][907] ([i915#14544] / [i915#6095]) +1 other test skip
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][908] ([i915#10307] / [i915#6095]) -> [SKIP][909] ([i915#17356]) +3 other tests skip
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][910] ([i915#14544] / [i915#6095]) -> [SKIP][911] ([i915#6095]) +3 other tests skip
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-rkl:          [SKIP][912] ([i915#17427]) -> [SKIP][913] ([i915#14544] / [i915#17427]) +1 other test skip
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_chamelium_color@ctm-negative.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          [SKIP][914] ([i915#14544] / [i915#16471] / [i915#17427]) -> [SKIP][915] ([i915#16471] / [i915#17427]) +1 other test skip
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-rkl:          [SKIP][916] ([i915#11151] / [i915#7828]) -> [SKIP][917] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][918] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][919] ([i915#11151] / [i915#7828]) +1 other test skip
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          [SKIP][920] ([i915#15330]) -> [SKIP][921] ([i915#14544] / [i915#15330])
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][922] ([i915#15330] / [i915#3116]) -> [SKIP][923] ([i915#14544] / [i915#15330] / [i915#3116])
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-rkl:          [SKIP][924] ([i915#14544] / [i915#15865]) -> [SKIP][925] ([i915#15865])
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_content_protection@uevent-hdcp14.html
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          [SKIP][926] ([i915#3555]) -> [SKIP][927] ([i915#17356]) +2 other tests skip
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][928] ([i915#17356]) -> [SKIP][929] ([i915#13049])
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          [SKIP][930] ([i915#14544] / [i915#3555]) -> [SKIP][931] ([i915#3555]) +1 other test skip
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          [SKIP][932] ([i915#3555]) -> [SKIP][933] ([i915#14544] / [i915#3555])
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          [SKIP][934] ([i915#11190] / [i915#17356]) -> [SKIP][935] ([i915#4103])
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2:          [SKIP][936] ([i915#4103]) -> [SKIP][937] ([i915#17356])
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          [SKIP][938] ([i915#17356]) -> [SKIP][939] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-dg2:          [SKIP][940] ([i915#17287]) -> [SKIP][941] ([i915#17356])
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          [SKIP][942] ([i915#17356]) -> [SKIP][943] ([i915#13748]) +1 other test skip
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][944] ([i915#17356]) -> [SKIP][945] ([i915#17285])
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-rkl:          [SKIP][946] ([i915#14544] / [i915#17285]) -> [SKIP][947] ([i915#17285])
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          [SKIP][948] ([i915#17356]) -> [SKIP][949] ([i915#13707])
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg2:          [SKIP][950] ([i915#16867]) -> [SKIP][951] ([i915#17356])
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          [SKIP][952] ([i915#17356]) -> [SKIP][953] ([i915#8812])
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][954] ([i915#8812]) -> [SKIP][955] ([i915#17356])
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][956] ([i915#14544] / [i915#16361]) -> [SKIP][957] ([i915#16361]) +1 other test skip
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-dg2:          [SKIP][958] ([i915#17356]) -> [SKIP][959] ([i915#16361]) +3 other tests skip
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][960] ([i915#16361]) -> [SKIP][961] ([i915#14544] / [i915#16361]) +1 other test skip
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-busy-flip:
    - shard-rkl:          [SKIP][962] ([i915#14544] / [i915#9934]) -> [SKIP][963] ([i915#9934]) +2 other tests skip
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_flip@2x-busy-flip.html
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][964] ([i915#14544] / [i915#15643]) -> [SKIP][965] ([i915#15643])
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          [SKIP][966] ([i915#15643]) -> [SKIP][967] ([i915#14544] / [i915#15643])
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][968] ([i915#15990] / [i915#8708]) -> [SKIP][969] ([i915#16708] / [i915#5354]) +11 other tests skip
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg1:          [SKIP][970] ([i915#17428]) -> [SKIP][971] ([i915#17428] / [i915#4423])
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt:
    - shard-dg1:          [SKIP][972] ([i915#15989] / [i915#4423]) -> [SKIP][973] ([i915#15989])
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt.html
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          [SKIP][974] ([i915#16708]) -> [SKIP][975] ([i915#15989]) +18 other tests skip
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][976] ([i915#16708]) -> [SKIP][977] ([i915#15991]) +33 other tests skip
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][978] ([i915#15989]) -> [SKIP][979] ([i915#16708]) +11 other tests skip
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-dg2:          [SKIP][980] ([i915#16708]) -> [SKIP][981] ([i915#10055])
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][982] ([i915#15102]) -> [SKIP][983] ([i915#16708]) +5 other tests skip
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][984] ([i915#15102]) -> [SKIP][985] ([i915#14544] / [i915#15102]) +10 other tests skip
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][986] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][987] ([i915#17428] / [i915#1825]) +1 other test skip
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][988] ([i915#17428]) -> [SKIP][989] ([i915#14544] / [i915#17428]) +21 other tests skip
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2:          [SKIP][990] ([i915#16708] / [i915#5354]) -> [SKIP][991] ([i915#15991] / [i915#5354]) +25 other tests skip
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2:          [SKIP][992] ([i915#15991] / [i915#5354]) -> [SKIP][993] ([i915#16708] / [i915#5354]) +11 other tests skip
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][994] ([i915#17428] / [i915#1825]) -> [SKIP][995] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-dg2:          [SKIP][996] ([i915#16708] / [i915#5354]) -> [SKIP][997] ([i915#15990] / [i915#8708]) +11 other tests skip
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][998] ([i915#15102]) -> [SKIP][999] ([i915#16708] / [i915#5354]) +4 other tests skip
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][1000] ([i915#16708] / [i915#5354]) -> [SKIP][1001] ([i915#10055])
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][1002] ([i915#15990]) -> [SKIP][1003] ([i915#16708]) +9 other tests skip
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-dg2:          [SKIP][1004] ([i915#10055]) -> [SKIP][1005] ([i915#16708])
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [SKIP][1006] ([i915#15991]) -> [SKIP][1007] ([i915#16708]) +18 other tests skip
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][1008] ([i915#14544] / [i915#17428]) -> [SKIP][1009] ([i915#17428]) +31 other tests skip
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt.html
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:
    - shard-dg2:          [SKIP][1010] ([i915#16708]) -> [SKIP][1011] ([i915#15990]) +15 other tests skip
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][1012] ([i915#16708]) -> [SKIP][1013] ([i915#15104] / [i915#15990])
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][1014] ([i915#14544] / [i915#15102]) -> [SKIP][1015] ([i915#15102]) +15 other tests skip
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          [SKIP][1016] ([i915#16708] / [i915#5354]) -> [SKIP][1017] ([i915#15102]) +16 other tests skip
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - shard-dg2:          [SKIP][1018] ([i915#16708]) -> [SKIP][1019] ([i915#15102]) +11 other tests skip
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][1020] ([i915#17356]) -> [SKIP][1021] ([i915#12713] / [i915#16518])
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][1022] ([i915#17356]) -> [SKIP][1023] ([i915#16518] / [i915#3555] / [i915#8228])
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_hdr@static-swap.html
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][1024] ([i915#14544] / [i915#15458]) -> [SKIP][1025] ([i915#15458])
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][1026] ([i915#17356]) -> [SKIP][1027] ([i915#6301])
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          [SKIP][1028] ([i915#6301]) -> [SKIP][1029] ([i915#14544] / [i915#6301])
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-rkl:          [SKIP][1030] ([i915#14544] / [i915#17455]) -> [SKIP][1031] ([i915#17455]) +2 other tests skip
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][1032] ([i915#14544] / [i915#15709]) -> [SKIP][1033] ([i915#15709])
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-mtlp:         [FAIL][1034] ([i915#17208]) -> [INCOMPLETE][1035] ([i915#13026]) +1 other test incomplete
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          [SKIP][1036] ([i915#17356]) -> [SKIP][1037] ([i915#13958]) +1 other test skip
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html
   [1037]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][1038] ([i915#15329]) -> [SKIP][1039] ([i915#14544] / [i915#15329]) +3 other tests skip
   [1038]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [1039]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][1040] ([i915#9340]) -> [SKIP][1041] ([i915#3828])
   [1040]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
   [1041]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][1042] ([i915#14544] / [i915#8430]) -> [SKIP][1043] ([i915#8430])
   [1042]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html
   [1043]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-rkl:          [SKIP][1044] ([i915#14544] / [i915#17434] / [i915#17450]) -> [SKIP][1045] ([i915#17434] / [i915#17450])
   [1044]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html
   [1045]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][1046] ([i915#11520]) -> [SKIP][1047] ([i915#11520] / [i915#14544])
   [1046]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [1047]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][1048] ([i915#11520] / [i915#14544]) -> [SKIP][1049] ([i915#11520]) +2 other tests skip
   [1048]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [1049]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-rkl:          [SKIP][1050] ([i915#1072] / [i915#9732]) -> [SKIP][1051] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [1050]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_psr@fbc-pr-suspend.html
   [1051]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][1052] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1053] ([i915#1072] / [i915#9732]) +8 other tests skip
   [1052]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html
   [1053]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][1054] ([i915#17356]) -> [SKIP][1055] ([i915#12755] / [i915#15867])
   [1054]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html
   [1055]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          [SKIP][1056] ([i915#5190]) -> [SKIP][1057] ([i915#17356] / [i915#5190]) +1 other test skip
   [1056]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [1057]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][1058] ([i915#12755] / [i915#15867]) -> [SKIP][1059] ([i915#17356])
   [1058]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-270.html
   [1059]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          [SKIP][1060] ([i915#17356]) -> [SKIP][1061] ([i915#3555]) +2 other tests skip
   [1060]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_scaling_modes@scaling-mode-none.html
   [1061]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-glk:          [ABORT][1062] ([i915#13179]) -> [DMESG-FAIL][1063] ([i915#13179])
   [1062]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
   [1063]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][1064] ([i915#8623]) -> [SKIP][1065] ([i915#17356])
   [1064]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html
   [1065]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][1066] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][1067] ([i915#15243] / [i915#3555])
   [1066]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [1067]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          [SKIP][1068] ([i915#15243] / [i915#3555]) -> [SKIP][1069] ([i915#17356])
   [1068]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_vrr@flipline.html
   [1069]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          [SKIP][1070] ([i915#11920]) -> [SKIP][1071] ([i915#17356])
   [1070]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_vrr@lobf.html
   [1071]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][1072] ([i915#9906]) -> [SKIP][1073] ([i915#17356])
   [1072]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_vrr@max-min.html
   [1073]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          [SKIP][1074] ([i915#17356]) -> [SKIP][1075] ([i915#9906])
   [1074]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [1075]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][1076] ([i915#14544] / [i915#2434]) -> [SKIP][1077] ([i915#2434])
   [1076]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@perf@mi-rpc.html
   [1077]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][1078] ([i915#14544] / [i915#2435]) -> [SKIP][1079] ([i915#2435])
   [1078]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [1079]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][1080] ([i915#8516]) -> [SKIP][1081] ([i915#14544] / [i915#8516])
   [1080]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html
   [1081]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][1082] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][1083] ([i915#17448] / [i915#3708])
   [1082]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [1083]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15997]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17170
  [i915#17171]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171
  [i915#17173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17173
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17189]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189
  [i915#17190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190
  [i915#17208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17208
  [i915#17214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214
  [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17485]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485
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
  [i915#17513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
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
  [i915#17532]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17558]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17558
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17563]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17563
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
  [i915#17574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17574
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17597]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17605]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17605
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17619]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17619
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17630]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17630
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17640]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17640
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17700]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17710]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9169 -> IGTPW_16060

  CI-20190529: 20190529
  CI_DRM_19402: 6a182ac542350dbca9147134654c35e463aa1382 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16060: 16060
  IGT_9169: 9169

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/index.html

--===============2030019785082646084==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/msm/msm_bo: Extend buffer object test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177014/">https://patchwork.freedesktop.org/series/177014/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9169_full -&gt; IGTPW_16060_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16060_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16060_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16060_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy@wc:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-2/igt@gem_userptr_blits@map-fixed-invalidate-busy@wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@gem_userptr_blits@map-fixed-invalidate-busy@wc.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9169_full and IGTPW_16060_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-c-hdmi-a-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16060_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513">i915#17513</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513">i915#17513</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_ctx_persistence@engines-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_ctx_shared@q-smoketest-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342">i915#17342</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496">i915#17496</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-6/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i915#17190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@gem_exec_balancer@full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587">i915#17587</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547">i915#17547</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711">i915#17711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599">i915#17599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565">i915#17565</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523">i915#17523</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@gem_exec_schedule@preempt-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590">i915#17590</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_gtt_cpu_tlb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@gem_gtt_cpu_tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17605">i915#17605</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17605">i915#17605</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_mmap_gtt@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@gem_mmap_gtt@basic-write-read-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@gem_render_copy@yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@gem_render_copy@yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591">i915#17591</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532">i915#17532</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +5 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871">i915#16871</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597">i915#17597</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@i915_drm_fdinfo@busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@i915_drm_fdinfo@isolation@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@i915_drm_fdinfo@memory-info-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603">i915#17603</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@i915_drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@i915_hangman@engine-engine-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610">i915#17610</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600">i915#17600</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706">i915#17706</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17619">i915#17619</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17574">i915#17574</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17563">i915#17563</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@i915_suspend@sysfs-reader.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17170">i915#17170</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171">i915#17171</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668">i915#17668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_atomic@atomic-plane-damage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +9 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17630">i915#17630</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +10 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147">i915#17147</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +9 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594">i915#17594</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +4 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +13 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_color@background-color@pipe-a-background-color.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133">i915#17133</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17640">i915#17640</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_color@legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +23 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-9/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515">i915#17515</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17519">i915#17519</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664">i915#17664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506">i915#17506</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625">i915#17625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189">i915#17189</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349">i915#17349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570">i915#17570</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539">i915#17539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip@flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214">i915#17214</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-2/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465">i915#17465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +100 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +28 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +163 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-glk11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276">i915#17276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">i915#17357</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) +1 other test abort</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_invalid_mode@bad-hsync-start.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-3/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567">i915#17567</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +5 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700">i915#17700</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-7/igt@kms_plane_alpha_blend@coverage-7efc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane_alpha_blend@coverage-7efc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542">i915#17542</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb5/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495">i915#17495</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i915#17564</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602">i915#17602</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-16/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710">i915#17710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_properties@colorop-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk5/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-8/igt@kms_psr@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_psr@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226">i915#17226</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-12/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk9/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17558">i915#17558</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb6/igt@perf@blocking-parameterized.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592">i915#17592</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-ctx-handle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i915#17536</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@perf@gen12-group-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@perf_pmu@busy-idle@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-7/igt@perf_pmu@busy-idle@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119">i915#17119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997">i915#15997</a>) +1 other test fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997">i915#15997</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk1/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583">i915#17583</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk10/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583">i915#17583</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk11/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-10/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-17/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-snb7/igt@sysfs_timeslice_duration@duration@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632">i915#17632</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@drm_read@short-buffer-block.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@drm_read@short-buffer-block.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@fbdev@read.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@fbdev@read.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-16/igt@fbdev@read.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-14/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@i915_pm_rpm@debugfs-read.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@i915_pm_rpm@debugfs-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@i915_pm_rps@reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@i915_suspend@basic-s3-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_busy@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_color@ctm-0-75.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189">i915#17189</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349">i915#17349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i915#9738</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_feature_discovery@display-1x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk9/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17173">i915#17173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_vblank@wait-idle-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_vblank@wait-idle-hang.html">PASS</a> +43 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-mtlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17208">i915#17208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-mtlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-3/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-2/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9169/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16060/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9169 -&gt; IGTPW_16060</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19402: 6a182ac542350dbca9147134654c35e463aa1382 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16060: 16060<br />
  IGT_9169: 9169</p>

</body>
</html>

--===============2030019785082646084==--
