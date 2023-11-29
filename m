Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 29 Nov 2023 15:16:32 -0000
Message-ID: <170127099269.12091.11242011367996859851@emeril.freedesktop.org>
References: <20231129145457.7-1-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB1QVBJ?=
 =?utf-8?q?_Alignment_-_Cleanup_and_future_proof_=28rev4=29?=
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

Series: uAPI Alignment - Cleanup and future proof (rev4)
URL   : https://patchwork.freedesktop.org/series/126537/
State : failure

== Summary ==

Applying: drm-uapi/xe: Extend drm_xe_vm_bind_op
Applying: xe_ioctl: Converge bo_create to the most used version
Using index info to reconstruct a base tree...
M	lib/xe/xe_ioctl.c
M	lib/xe/xe_ioctl.h
M	tests/intel/xe_vm.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_vm.c
Auto-merging lib/xe/xe_ioctl.h
CONFLICT (content): Merge conflict in lib/xe/xe_ioctl.h
Auto-merging lib/xe/xe_ioctl.c
CONFLICT (content): Merge conflict in lib/xe/xe_ioctl.c
Patch failed at 0002 xe_ioctl: Converge bo_create to the most used version
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

