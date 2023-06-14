Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Date: Wed, 14 Jun 2023 14:44:49 -0000
Message-ID: <168675388916.17429.9744692060996536792@emeril.freedesktop.org>
References: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbnRy?=
 =?utf-8?q?oduce_KUnit_=28rev8=29?=
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

Series: Introduce KUnit (rev8)
URL   : https://patchwork.freedesktop.org/series/114612/
State : failure

== Summary ==

Applying: lib/igt_kmod: rename kselftest functions to ktest
Using index info to reconstruct a base tree...
M	lib/igt_kmod.c
M	lib/igt_kmod.h
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_kmod.h
Auto-merging lib/igt_kmod.c
No changes -- Patch already applied.
Applying: lib/igt_kmod.c: check if module is builtin before attempting to unload it
Using index info to reconstruct a base tree...
M	lib/igt_kmod.c
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_kmod.c
No changes -- Patch already applied.
Applying: lib/igt_kmod: add compatibility for KUnit
Using index info to reconstruct a base tree...
M	lib/igt_kmod.c
M	lib/igt_kmod.h
M	lib/meson.build
Falling back to patching base and 3-way merge...
CONFLICT (add/add): Merge conflict in lib/igt_ktap.h
Auto-merging lib/igt_ktap.h
CONFLICT (add/add): Merge conflict in lib/igt_ktap.c
Auto-merging lib/igt_ktap.c
Auto-merging lib/igt_kmod.h
CONFLICT (content): Merge conflict in lib/igt_kmod.h
Auto-merging lib/igt_kmod.c
CONFLICT (content): Merge conflict in lib/igt_kmod.c
Patch failed at 0003 lib/igt_kmod: add compatibility for KUnit
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

