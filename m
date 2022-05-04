Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 May 2022 07:39:48 -0000
Message-ID: <165164998850.678.6013069841908407011@emeril.freedesktop.org>
References: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbXBy?=
 =?utf-8?q?ove_logic_to_work_with_audio_dependency_on_DRM_driver?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Improve logic to work with audio dependency on DRM driver
URL   : https://patchwork.freedesktop.org/series/103519/
State : failure

== Summary ==

Applying: tests/core_hotunplug: properly finish processes using audio devices
Applying: lib/igt_kmod: always fill who when unloading audio driver
Applying: lib/igt_kmod: improve audio unbind logic
Applying: core_hotunplug: fix audio unbind logic
Using index info to reconstruct a base tree...
M	tests/core_hotunplug.c
Falling back to patching base and 3-way merge...
Auto-merging tests/core_hotunplug.c
CONFLICT (content): Merge conflict in tests/core_hotunplug.c
Patch failed at 0004 core_hotunplug: fix audio unbind logic
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

