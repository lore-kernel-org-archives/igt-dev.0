Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 13 Apr 2021 14:29:51 -0000
Message-ID: <161832419151.8795.9255863418334781185@emeril.freedesktop.org>
References: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbnRy?=
 =?utf-8?q?oduce_IGT_allocator_=28rev37=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce IGT allocator (rev37)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

Applying: lib/igt_list: Add igt_list_del_init()
Using index info to reconstruct a base tree...
M	lib/igt_list.c
M	lib/igt_list.h
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_list.h
No changes -- Patch already applied.
Applying: lib/igt_list: Add igt_list_for_each_entry_safe_reverse
Using index info to reconstruct a base tree...
M	lib/igt_list.h
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: lib/igt_map: Adopt Mesa hash table
Using index info to reconstruct a base tree...
M	docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
M	lib/meson.build
Falling back to patching base and 3-way merge...
Auto-merging lib/meson.build
Auto-merging docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
No changes -- Patch already applied.
Applying: lib/igt_core: Track child process pid and tid
Using index info to reconstruct a base tree...
M	lib/igt_core.c
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_core.c
No changes -- Patch already applied.
Applying: lib/intel_allocator_simple: Add simple allocator
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
CONFLICT (add/add): Merge conflict in lib/intel_allocator_simple.c
Auto-merging lib/intel_allocator_simple.c
Patch failed at 0005 lib/intel_allocator_simple: Add simple allocator
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
