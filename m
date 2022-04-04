Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F6510E337
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 18:07:27 +0000 (UTC)
Message-ID: <0964d752-f3dd-bc89-8dbd-f77557001f5a@linux.intel.com>
Date: Mon, 4 Apr 2022 20:07:24 +0200
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220404171534.355029-1-zbigniew.kempczynski@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220404171534.355029-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_softpin: Use valid
 context when iterating over engines
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

LGTM Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 4/4/2022 7:15 PM, Zbigniew Kempczyński wrote:
> For previous gens this bug was not discovered because newly created
> context over physical engines has same number of engines. For discrete
> this is not true so using bigger index taken from new context on
> default is leading to -EINVAL.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/i915/gem_softpin.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 34fc9983ff..448b4c4b9e 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -1002,6 +1002,7 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
>   	execbuf.buffer_count = 1;
>   	if (gen < 6)
>   		execbuf.flags |= I915_EXEC_SECURE;
> +	execbuf.rsvd1 = ctx->id;
>   
>   	batches = calloc(count, sizeof(*batches));
>   	igt_assert(batches);
