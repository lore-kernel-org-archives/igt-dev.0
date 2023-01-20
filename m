Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <46f7db49-eb5c-515f-b450-75cac53d770e@linux.intel.com>
Date: Fri, 20 Jan 2023 15:29:43 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
References: <20230119155428.3260937-1-tvrtko.ursulin@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230119155428.3260937-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Fix cleanup
 on old kernels / unsupported GPU
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

Hi Tvrtko,

On 1/19/2023 4:54 PM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Avoid trying to dereference null engines on exit when there are either
> none which are supported, or kernel does not have i915 PMU support.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tools/intel_gpu_top.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 7aa233570463..517dc2995d26 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -448,6 +448,9 @@ static void free_engines(struct engines *engines)
>   	};
>   	unsigned int i;
>   
> +	if (!engines)
> +		return;
> +


This check should happen before the  struct pmu_counter free_list 
generation.


Regards,

Nirmoy

>   	for (pmu = &free_list[0]; *pmu; pmu++) {
>   		if ((*pmu)->present)
>   			free((char *)(*pmu)->units);
> @@ -2568,7 +2571,7 @@ int main(int argc, char **argv)
>   			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required for i915 PMU support.)\n",
>   			strerror(errno));
>   		ret = EXIT_FAILURE;
> -		goto err;
> +		goto err_engines;
>   	}
>   
>   	ret = pmu_init(engines);
> @@ -2585,7 +2588,7 @@ int main(int argc, char **argv)
>   "More information can be found at 'Perf events and tool security' document:\n"
>   "https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
>   		ret = EXIT_FAILURE;
> -		goto err;
> +		goto err_pmu;
>   	}
>   
>   	ret = EXIT_SUCCESS;
> @@ -2699,8 +2702,9 @@ int main(int argc, char **argv)
>   		free_clients(clients);
>   
>   	free(codename);
> -err:
> +err_pmu:
>   	free_engines(engines);
> +err_engines:
>   	free(pmu_device);
>   exit:
>   	igt_devices_free();
