Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841C010E004
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Dec 2023 10:49:12 +0000 (UTC)
Message-ID: <8e7a8f4b-a4c8-4543-82bb-54c8ec66d321@linux.intel.com>
Date: Thu, 28 Dec 2023 11:49:09 +0100
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 1/3] lib/intel_compute_square_kernels: Add xe2lpg
 wmtp sip and long running opencl kernel
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, nirmoy.das@intel.com
References: <20231228001510.1399329-1-janga.rahul.kumar@intel.com>
 <20231228001510.1399329-2-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231228001510.1399329-2-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Rahul,

On 12/28/2023 1:15 AM, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
> WMTP sip is responsible for save/restore during preemption.
> Compute square kernel with an loop of INT_MAX is used as
> long running kerenl which can used to exercise preemption
> scenarios when combined with short running opencl kernel.
>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   lib/intel_compute.h                |    4 +
>   lib/intel_compute_square_kernels.c | 4927 ++++++++++++++++++++++++++++
>   2 files changed, 4931 insertions(+)
>
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index bd0348da3..9ea87b528 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -25,6 +25,10 @@ struct intel_compute_kernels {
>   	int ip_ver;
>   	unsigned int size;
>   	const unsigned char *kernel;
> +	unsigned int sip_kernel_size;
> +	const unsigned char *sip_kernel;
> +	unsigned int long_kernel_size;
> +	const unsigned char *long_kernel;
>   };
>   
>   extern const struct intel_compute_kernels intel_compute_square_kernels[];
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 682fdfcf6..f8539a2c0 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -214,6 +214,4929 @@ static const unsigned char xe2lpg_kernel_square_bin[] = {
>   	0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
>   };
>   
> +static const unsigned char xe2lpg_kernel_sip_bin[] = {
> +	0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00,
> +	0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x09, 0x00, 0x80, 0x20, 0x02, 0xB5, 0x00,
> +	0x04, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
<snip>
>
> +	0x10, 0x80, 0x00, 0x02, 0xFF, 0xFF, 0xFF, 0xFE,
> +	0x60, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x65, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> +	0x00, 0x80, 0x00, 0x02, 0xFF, 0xFF, 0xFF, 0x7F,
> +	0x60, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +};
> +
> +static unsigned char xe2lpg_sqaure_int_max_loop_bin[] = {
Please add a opencl code as reference.
> +

<snip>

Regards,

Nirmoy

> +
>   const struct intel_compute_kernels intel_compute_square_kernels[] = {
>   	{
>   		.ip_ver = IP_VER(12, 0),
> @@ -239,6 +5162,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>   		.ip_ver = IP_VER(20, 04),
>   		.size = sizeof(xe2lpg_kernel_square_bin),
>   		.kernel = xe2lpg_kernel_square_bin,
> +		.long_kernel = xe2lpg_sqaure_int_max_loop_bin,
> +		.long_kernel_size = sizeof(xe2lpg_sqaure_int_max_loop_bin),
> +		.sip_kernel = xe2lpg_kernel_sip_bin,
> +		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
>   	},
>   	{}
>   };
