Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302AA891C0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 13:06:08 +0000 (UTC)
Date: Tue, 20 Sep 2022 16:04:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Message-ID: <Yym6YxVf671RyKr3@platvala-desk.ger.corp.intel.com>
References: <20220912054131.18482-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912054131.18482-1-stanislav.lisovskiy@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/i915/i915_pipe_stress: Add plane pipes
 stress test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 08:41:31AM +0300, Stanislav Lisovskiy wrote:
> This test attempts to utilize all connected
> outputs at the same time, using maximum possible
> resolution and amount of planes, to check whether
> we are hiting any kind of bandwidth, watermark or
> other limitations.
> 
> v2: Use igt_skip_on to skip unsupported formats in
>     fixture properly.
> 
> v3: - Changed to SPDX license
>     - Removed execution engine usage, which seems to
>       be not needed yet here
>     - Fixed some obvious things found, like missing
>       dot and new line after declarations
>     - Added igt_skip_on to igt_fixture to properly
>       skip formats/modifiers, not supported on
>       current platform.
> 
> v4: - Added mutex, as gpu_fill seems to cause some
>       crashes if run from multiple threads.
>     - Some additional info addedy
> 
> v5: - Removed igt_require_f as it is being called from
>       non-main thread(Petri Latvala)
> 
> v6: - Added igt_assert for fill_fn
>     - Don't do gpu fill for gens < 8, as there are seem
>       to be some issues, when it is done from multiple
>       threads.
> 
> v7: - Apparently need to exclude ApolloLake as well.
>       Anyways we are not much interested in stress-testing
>       those.
> 
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>


Recap of what we discussed about this offline is:
Acked-by: Petri Latvala <petri.latvala@intel.com>

But someone with more kms experience could be useful for having a
sanity checking look over this.
