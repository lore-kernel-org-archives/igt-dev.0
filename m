Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <34309cb8-d6e5-7842-52ad-369960440fb6@intel.com>
Date: Wed, 7 Jun 2023 15:47:41 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
References: <20230606221418.296888-1-vinay.belgaumkar@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20230606221418.296888-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/gem_ctx_persistence:
 Skip hang subtest with GuC
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

On 07.06.2023 00:14, Vinay Belgaumkar wrote:
> Hang subtest is not supported with GuC submission enabled >
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Maybe providing more specific explanation would be better. Sth like:
GuC does not support dynamically configurable options, particularly
hangcheck disabling/enabling.

This is at least what I understood from internal bug tracker.
I wonder if it shouldn't be done also on driver level.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/i915/gem_ctx_persistence.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index df9b1c491..d2558354e 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -577,6 +577,8 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
>   	int testable_engines = 0;
>   	int dir;
>   
> +	igt_require(!gem_using_guc_submission(i915));
> +
>   	cleanup(i915);
>   
>   	/*
