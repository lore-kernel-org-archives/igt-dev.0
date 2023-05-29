Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F9810E280
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 16:14:32 +0000 (UTC)
Message-ID: <7ad9db60-99f4-f1ff-777a-d744c27a59ab@intel.com>
Date: Mon, 29 May 2023 18:14:22 +0200
To: Andrzej Hajda <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230529122104.391866-1-andrzej.hajda@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230529122104.391866-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: skip
 noheartbeat test with GuC
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


On 5/29/2023 2:21 PM, Andrzej Hajda wrote:
> GuC does not support fully updating of persisting contexts, especially
> heartbeat related parameters.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3952
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
> Hi,
>
> This is another case where GuC does not support runtime disabling
> heartbeat. I hope the last one.
>
> Regards
> Andrzej
> ---
>   tests/i915/gem_exec_balancer.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 3ab0903ac89..004ba9a14fe 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -2938,6 +2938,8 @@ static void noheartbeat(int i915)
>   {
>   	const struct intel_execution_engine2 *e;
>   
> +	igt_require(!gem_using_guc_submission(i915));
> +
>   	/*
>   	 * Check that non-persistent contexts are also cleaned up if we
>   	 * close the context while they are active, but the engine's
