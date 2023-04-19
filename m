Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C001110E1EA
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 21:02:00 +0000 (UTC)
Date: Wed, 19 Apr 2023 23:01:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230419210156.vstclygwk742pde7@kamilkon-desk1>
References: <20230419203243.20058-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230419203243.20058-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: update blacklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

On 2023-04-20 at 02:02:43 +0530, Nidhi Gupta wrote:
> Following tests are added in blacklist:
> -Block vmwgfx tests
> -Block execution of tests on pipe-g and  pipe-h
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 243bc609..13ad3b5b 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -93,6 +93,10 @@ igt@v3d_.*
>  ###############################################
>  igt@amdgpu/.*
>  ###############################################
> +# VMware
> +###############################################
> +igt@vmwgfx/.*
------------ ^
Remove '/' so it will be:

igt@vmwgfx.*

With that fixed:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +###############################################
>  # Panfrost
>  ###############################################
>  igt@panfrost_.*
> @@ -113,10 +117,12 @@ igt@gem_ctx_isolation@.*-s4
>  ###############################################
>  igt@i915_suspend@shrink
>  ###############################################
> -# pipe-e, pipe-f no current HW support
> +# pipe-e, pipe-f, pipe-g, pipe-h no current HW support
>  ###############################################
>  igt@.*@.*pipe-e($|-.*)
>  igt@.*@.*pipe-f($|-.*)
> +igt@.*@.*pipe-g($|-.*)
> +igt@.*@.*pipe-h($|-.*)
>  
>  ###############################################
>  # Temporary workarounds for CI-impacting bugs
> -- 
> 2.39.0
> 
