Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D7D10E48B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 08:39:54 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 470D5580DAB
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 01:39:52 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qHKWj-0021Ff-23
 for igt-dev@lists.freedesktop.org; Thu, 06 Jul 2023 10:39:49 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 10:39:46 +0200
Message-Id: <20230706083947.481216-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Simplify tests/meson.build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Some tests used on core and Intel driver have special requirements,
e. g. extra libraries and/or extra C files.

Right now, they all have their own special executable() target. This
makes the meson.build file messy, and makes harder to add extra
logic inside the foreach loops.

This patch shouldn't have any real impact: it just makes the file
a lot simpler by dropping all those extra build targets. Now, mapping
extra dependencies/sources are done via two dictionaries:

    extra_sources = {
	'core_hotunplug': [ 'core_hotunplug.c' ],
	'dumb_buffer': ['dumb_buffer.c' ],
	'testdisplay': [ 'testdisplay_hotplug.c' ],
	'kms_color':  [ 'kms_color_helper.c' ],
	'kms_dsc': [ join_paths ('i915', 'kms_dsc_helper.c') ],
	'kms_psr2_sf':  [ join_paths ('i915', 'kms_dsc_helper.c') ],
    }

    extra_dependencies = {
	'core_hotunplug': [ lib_igt_i915_perf ],
	'drm_fdinfo': [ lib_igt_drm_fdinfo ],
	'dumb_buffer':  [ libatomic ],
	'gem_barrier_race': [ lib_igt_i915_perf ],
	'gem_create': [ libatomic ],
	'gem_ctx_freq': [ lib_igt_perf ],
	'gem_ctx_sseu': [ lib_igt_perf ],
	'gem_eio': [ realtime ],
	'gem_exec_balancer': [ lib_igt_perf ],
	'gem_mmap_offset': [ libatomic ],
	'i915_pm_freq_mult': [ lib_igt_perf ],
	'i915_pm_rc6_residency': [ lib_igt_perf ],
	'perf': [ lib_igt_i915_perf ],
	'perf_pmu':  [ lib_igt_perf ],
	'sw_sync': [ libatomic ],
    }

Mauro Carvalho Chehab (1):
  tests/meson.build: Simplify builds for core and i915 targets

 tests/meson.build | 223 +++++++++++++---------------------------------
 1 file changed, 61 insertions(+), 162 deletions(-)

-- 
2.40.1
