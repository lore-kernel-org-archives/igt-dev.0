Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 22 Aug 2023 23:03:22 -0000
Message-ID: <169274540282.20553.11650720139544689231@emeril.freedesktop.org>
References: <20230822185507.26407-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230822185507.26407-1-thomas.hellstrom@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/xe/xe=5Fexec=5Fcompute=5Fmode=3A_Test_pinned_userptr_function?=
 =?utf-8?q?ality?=
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

== Series Details ==

Series: tests/xe/xe_exec_compute_mode: Test pinned userptr functionality
URL   : https://patchwork.freedesktop.org/series/122760/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa tests/amdgpu: Fix build error due to external file include

Tail of build.log:
Warning: igt@xe_uevent@fake_reset_uevent_listener Run type documentation is missing
Warning: igt@xe_vm@mmap-style-bind-all Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-full Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-end Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-front Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-many-all Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-many-either-side-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-one-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-all Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-either-side-full Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-either-side-partial Functionality documentation is missing
Warning: igt@xe_vm@mmap-style-bind-userptr-one-partial Functionality documentation is missing
Warning: Missing documentation for igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-bindexecqueue-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-execqueues-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-execqueues-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-userptr-invalidate-race-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@many-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-bindexecqueue-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-userptr-invalidate-race-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@once-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-userptr-invalidate-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-userptr-invalidate-race-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-userptr-pin
Warning: Missing documentation for igt@xe_exec_compute_mode@twice-userptr-rebind-pin
[1621/1626] Generating kms_tests.rst with a custom command.
[1622/1626] Generating i915_tests.rst with a custom command.
ninja: build stopped: subcommand failed.

