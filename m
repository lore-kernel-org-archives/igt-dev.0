Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4BFC3DA45
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 09:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFF310E239;
	Wed, 10 Jul 2024 09:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LWdv26nL";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2708010E239
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 09:48:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6894F6000E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720604898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VqwEYy8vJ+jcz84Kj1CL112ZH4MQGjZ8qFGOF97L3BQ=;
 b=LWdv26nLD6wyMY2FUvk7YvFoh44Cs32NOkrYHv9OhLG2JpSi79JsK2uQ3qrqS2YlWTZFay
 BeYOjhUhJKIA1sMOpfkBmm3KEgFUObiKjQb6kMbRq7J3y1iQZb0s9zGx7Quwy82WSY4fF7
 SQRDPXQ0dip1oLTYlQfwnt2ftCDMsayZN5MYkntpVyi059WLPgIfybcCIoIlYmskxtOvhE
 zrr1QOqk8w8PPPycxRcIwcXCrHREEx3x08jRDgvAzZLhYU5J+AErns0tbSvT6E6O2P0APd
 Wig1mUNWf6q0R/3F5XDejq5ZMfmJ6v61qo5BmIFqmv3OkDE6zidcTwfh39e2cA==
Date: Wed, 10 Jul 2024 11:48:17 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxE?= =?utf-8?Q?=3A?= failure for
 tests/chamelium: Integrate the chamelium v3
Message-ID: <Zo5Y4acIaFzsJxW3@louis-chauvet-laptop>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <172054176637.86477.2526307237145811654@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172054176637.86477.2526307237145811654@2413ebb6fbb6>
X-GND-Sasl: louis.chauvet@bootlin.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi all,

It seems like I forgot to include errno.h. Should I send a new version or 
wait for comments before?

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index fa70e2c1e296..4ed408a49afb 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0

+#include <errno.h>
+
 #include <xmlrpc-c/base.h>
 #include <xmlrpc-c/client.h>


This morning I attempted to run the CI locally to avoid more errors, it 
was a bit tricky (gitlab-runner deprecated the exec option to run the CI 
locally, the images used are in the private docker repository, I had to 
rebuild docker image myself).

With the following diff, the fedora build seems to pass, but I have some 
timeout on tests, this timeout is also present on master.

 PASS  build:tests-fedora
 PASS  build:tests-fedora-no-libunwind
 PASS  build:tests-fedora-oldest-meson
 PASS  build:tests-fedora-no-libdrm-nouveau
 PASS  build:tests-fedora-clang
 PASS  test:list-undocumented-tests
 PASS  test:verify-blacklists
 FAIL  test:ninja-test
  > Skipped:               0
  > Timeout:               1
  > Full log written to /gcl-builds/build/meson-logs/testlog.txt
 FAIL  test:ninja-test-clang
  > Skipped:               0
  > Timeout:               1
  > Full log written to /gcl-builds/build/meson-logs/testlog.txt

For test:ninja-test
419/431 runner                                  TIMEOUT 300.01 s

For test:ninja-test-clang
419/431 runner                                  TIMEOUT 300.00 s

I am not able to run debian images, I tried to build the Dockerfile, but 
the debian version seems too old (404 during apt update), and I am not 
able to fetch prebuild images from gitlab (it seems to require API keys).

I will send a series to explain how to run the CI locally.

> == Series Details ==
> 
> Series: tests/chamelium: Integrate the chamelium v3
> URL   : https://patchwork.freedesktop.org/series/135910/
> State : failure
> 
> == Summary ==
> 
> IGT patchset build failed on latest successful build
> a7ef4e2bacb168f19605851986629d462b097df6 lib/i915/perf: Add ARL support in IGT perf library
> 
> Tail of build.log:
> [381/1759] Compiling C object 'lib/76b5a35@@igt-igt_v3d_c@sta/igt_v3d.c.o'.
> [382/1759] Compiling C object 'lib/76b5a35@@igt-gpu_cmds_c@sta/gpu_cmds.c.o'.
> [383/1759] Compiling C object 'tests/59830eb@@kms_selftest@exe/kms_selftest.c.o'.
> [384/1759] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen7_c@sta/rendercopy_gen7.c.o'.
> [385/1759] Compiling C object 'tests/59830eb@@kms_sysfs_edid_timing@exe/kms_sysfs_edid_timing.c.o'.
> [386/1759] Compiling C object 'tests/59830eb@@gem_softpin@exe/intel_gem_softpin.c.o'.
> [387/1759] Compiling C object 'tests/59830eb@@kms_scaling_modes@exe/kms_scaling_modes.c.o'.
> [388/1759] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
> [389/1759] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen6_c@sta/rendercopy_gen6.c.o'.
> [390/1759] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o'.
> [391/1759] Compiling C object 'tests/59830eb@@kms_plane_multiple@exe/kms_plane_multiple.c.o'.
> [392/1759] Compiling C object 'tests/59830eb@@kms_tv_load_detect@exe/kms_tv_load_detect.c.o'.
> [393/1759] Compiling C object 'tests/59830eb@@kms_rmfb@exe/kms_rmfb.c.o'.
> [394/1759] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o'.
> [395/1759] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
> [396/1759] Compiling C object 'lib/76b5a35@@igt-intel_bufops_c@sta/intel_bufops.c.o'.
> [397/1759] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
> [398/1759] Compiling C object 'lib/76b5a35@@igt-igt_pm_c@sta/igt_pm.c.o'.
> [399/1759] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
> [400/1759] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
> [401/1759] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
> [402/1759] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
> [403/1759] Generating i915-perf-registers-acmgt3 with a custom command.
> [404/1759] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o'.
> [405/1759] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
> [406/1759] Compiling C object 'tests/59830eb@@kms_sequence@exe/kms_sequence.c.o'.
> [407/1759] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
> [408/1759] Compiling C object 'lib/76b5a35@@xe_oa@sha/meson-generated_.._xe_oa_equations.c.o'.
> [409/1759] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
> [410/1759] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o'.
> [411/1759] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
> [412/1759] Generating i915-perf-metrics-acmgt3 with a custom command.
> [413/1759] Compiling C object 'lib/76b5a35@@igt-igt_kmod_c@sta/igt_kmod.c.o'.
> [414/1759] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
> [415/1759] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
> [416/1759] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
> [417/1759] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
> [418/1759] Compiling C object 'lib/76b5a35@@igt-chamelium_v2_igt_chamelium_c@sta/chamelium_v2_igt_chamelium.c.o'.
> [419/1759] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
> [420/1759] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
> [421/1759] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
> [422/1759] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
> [423/1759] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
> [424/1759] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
> [425/1759] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
> [426/1759] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
> [427/1759] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
> [428/1759] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
> [429/1759] Generating i915-perf-equations with a custom command.
> ninja: build stopped: subcommand failed.
> 
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
