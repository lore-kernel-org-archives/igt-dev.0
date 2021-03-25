Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Thu, 25 Mar 2021 20:59:11 +0200
Message-Id: <20210325185915.51590-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/5] benchmarks: Build gem_exec_tracer
 with meson
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Seems it has been overlooked during mesonification.

It's a shared module that's meant to be LD_PRELOAD-ed to intercept
EXECBUFFER2 calls for the purpose of replaying them later.

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 benchmarks/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index c70e1aac..bede51dc 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -35,3 +35,11 @@ foreach prog : benchmark_progs
 		   install_dir : benchmarksdir,
 		   dependencies : igt_deps)
 endforeach
+
+lib_gem_exec_tracer = shared_module(
+  'gem_exec_tracer',
+  'gem_exec_tracer.c',
+  dependencies : dlsym,
+  include_directories : inc,
+  install_dir : benchmarksdir,
+  install: true)
-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
