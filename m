Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 7 Jun 2023 19:29:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230607172916.b5e6l2a3pndcnxxm@kamilkon-desk1>
References: <20230606221418.296888-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230606221418.296888-1-vinay.belgaumkar@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/gem_ctx_persistence:
 Skip hang subtest with GuC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vinay,

On 2023-06-06 at 15:14:18 -0700, Vinay Belgaumkar wrote:
> Hang subtest is not supported with GuC submission enabled.

This is Guc which do not support some operations, so please
improve description, maybe use Andrzej suggestions ?

Regards,
Kamil

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/i915/gem_ctx_persistence.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index df9b1c491..d2558354e 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -577,6 +577,8 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
>  	int testable_engines = 0;
>  	int dir;
>  
> +	igt_require(!gem_using_guc_submission(i915));
> +
>  	cleanup(i915);
>  
>  	/*
> -- 
> 2.38.1
> 
