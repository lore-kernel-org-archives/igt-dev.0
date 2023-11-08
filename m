Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Date: Wed, 08 Nov 2023 09:07:54 -0000
Message-ID: <169943447489.24275.17465720568921976905@emeril.freedesktop.org>
References: <cover.1699473138.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1699473138.git.akshata.jahagirdar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBUaGlz?=
 =?utf-8?q?_patch_series_enables_the_compression_feature_for_XE2_Lunarlake?=
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

Series: This patch series enables the compression feature for XE2 Lunarlake
URL   : https://patchwork.freedesktop.org/series/126124/
State : failure

== Summary ==

Applying: XE2: LNL: adding Blt command support for Lunarlake
Applying: XE2: xe_ccs IGT changes to enable xe2 igfx compression
Using index info to reconstruct a base tree...
M	lib/intel_blt.c
M	lib/intel_blt.h
A	lib/intel_pat.c
A	lib/intel_pat.h
M	tests/intel/gem_ccs.c
M	tests/intel/xe_ccs.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_ccs.c
CONFLICT (content): Merge conflict in tests/intel/xe_ccs.c
Auto-merging tests/intel/gem_ccs.c
CONFLICT (modify/delete): lib/intel_pat.h deleted in HEAD and modified in XE2: xe_ccs IGT changes to enable xe2 igfx compression. Version XE2: xe_ccs IGT changes to enable xe2 igfx compression of lib/intel_pat.h left in tree.
CONFLICT (modify/delete): lib/intel_pat.c deleted in HEAD and modified in XE2: xe_ccs IGT changes to enable xe2 igfx compression. Version XE2: xe_ccs IGT changes to enable xe2 igfx compression of lib/intel_pat.c left in tree.
Auto-merging lib/intel_blt.h
Auto-merging lib/intel_blt.c
CONFLICT (content): Merge conflict in lib/intel_blt.c
Patch failed at 0002 XE2: xe_ccs IGT changes to enable xe2 igfx compression
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

