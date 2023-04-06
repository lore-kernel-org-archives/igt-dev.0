Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0B810E34F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 15:05:45 +0000 (UTC)
Message-ID: <890627f2-d4b0-0d1b-c060-c44556b358b1@linux.intel.com>
Date: Thu, 6 Apr 2023 16:05:33 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230406141538.3414368-1-tvrtko.ursulin@linux.intel.com>
 <168079229983.9550.3598269932155038055@emeril.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <168079229983.9550.3598269932155038055@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBWZW5k?=
 =?utf-8?q?or_agnostic_gputop_=28rev6=29?=
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



On 06/04/2023 15:44, Patchwork wrote:
> == Series Details ==
> 
> Series: Vendor agnostic gputop (rev6)
> URL   : https://patchwork.freedesktop.org/series/102175/
> State : failure
> 
> == Summary ==
> 
> Applying: lib: Extract igt_drm_clients from intel_gpu_top
> Applying: lib: Allow specifying custom engine map
> Using index info to reconstruct a base tree...
> M	lib/igt_drm_fdinfo.c
> M	tests/i915/drm_fdinfo.c
> Falling back to patching base and 3-way merge...
> Auto-merging tests/i915/drm_fdinfo.c
> Auto-merging lib/igt_drm_fdinfo.c
> CONFLICT (content): Merge conflict in lib/igt_drm_fdinfo.c
> Patch failed at 0002 lib: Allow specifying custom engine map
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 

commit 31871b929eb219e8be516b5e90337c4143507c26
Author:     Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
AuthorDate: Wed Apr 5 00:09:08 2023 +0000
Commit:     Kamil Konieczny <kamil.konieczny@linux.intel.com>
CommitDate: Thu Apr 6 14:34:44 2023 +0200

     lib/drm_fdinfo: Check for compute engines when parsing

Criss-cross.. another rebase.. But I'll wait until there are some reviews.

Regards,

Tvrtko
