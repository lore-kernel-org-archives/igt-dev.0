Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD43510E02F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 19:12:30 +0000 (UTC)
Date: Fri, 7 Oct 2022 21:12:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0B6GwexN54CBZmJ@kamilkon-desk1>
References: <20221007160203.8079-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007160203.8079-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_hangman: Idle the gpu for
 next test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-10-07 at 18:02:03 +0200, Nirmoy Das wrote:
> After each subtest gpu should be idle or else busy
> engine leaks into next subtest.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/5888
> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_hangman.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index ddbe10675a..8acce8f1a4 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -96,6 +96,7 @@ static void check_alive(void)
>  	gem_close(fd, scratch);
>  	put_ahnd(ahnd);
>  	intel_ctx_destroy(fd, ctx);
> +	gem_quiescent_gpu(fd);
>  	close(fd);
>  }
>  
> -- 
> 2.37.3
> 
