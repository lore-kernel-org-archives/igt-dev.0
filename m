Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Fri, 07 Apr 2023 22:10:34 -0000
Message-ID: <168090543460.5207.10620469748837819144@emeril.freedesktop.org>
References: <20230407215625.1551410-1-robdclark@gmail.com>
In-Reply-To: <20230407215625.1551410-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBncHV0?=
 =?utf-8?q?op_memory_information?=
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

Series: gputop memory information
URL   : https://patchwork.freedesktop.org/series/116236/
State : failure

== Summary ==

Applying: lib/igt_drm_fdinfo: Parse memory usage
Using index info to reconstruct a base tree...
M	lib/igt_drm_fdinfo.c
M	lib/igt_drm_fdinfo.h
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_drm_fdinfo.h
Auto-merging lib/igt_drm_fdinfo.c
Applying: gputop: Add memory information
Using index info to reconstruct a base tree...
A	lib/igt_drm_clients.c
A	lib/igt_drm_clients.h
A	tools/gputop.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tools/gputop.c deleted in HEAD and modified in gputop: Add memory information. Version gputop: Add memory information of tools/gputop.c left in tree.
CONFLICT (modify/delete): lib/igt_drm_clients.h deleted in HEAD and modified in gputop: Add memory information. Version gputop: Add memory information of lib/igt_drm_clients.h left in tree.
CONFLICT (modify/delete): lib/igt_drm_clients.c deleted in HEAD and modified in gputop: Add memory information. Version gputop: Add memory information of lib/igt_drm_clients.c left in tree.
Patch failed at 0002 gputop: Add memory information
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

