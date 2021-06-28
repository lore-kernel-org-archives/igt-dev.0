Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Jun 2021 14:42:59 -0000
Message-ID: <162489137951.2575.1258777090559777394@emeril.freedesktop.org>
References: <20210625140118.2600731-1-boris.brezillon@collabora.com>
In-Reply-To: <20210625140118.2600731-1-boris.brezillon@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/panfrost=3A_Misc_fixes/improvements_=28rev3=29?=
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
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/panfrost: Misc fixes/improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/91726/
State : failure

== Summary ==

Applying: tests/panfrost: Make sure we open a DUMB capable node for prime tests
Using index info to reconstruct a base tree...
M	tests/panfrost_prime.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: lib/panfrost: Handle the NULL case in igt_panfrost_free_bo()
Using index info to reconstruct a base tree...
M	lib/igt_panfrost.c
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_panfrost.c
No changes -- Patch already applied.
Applying: lib/panfrost: Add a helper to create a job loop
Using index info to reconstruct a base tree...
M	lib/igt_panfrost.c
M	lib/igt_panfrost.h
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_panfrost.h
CONFLICT (content): Merge conflict in lib/igt_panfrost.h
Auto-merging lib/igt_panfrost.c
CONFLICT (content): Merge conflict in lib/igt_panfrost.c
Patch failed at 0003 lib/panfrost: Add a helper to create a job loop
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
