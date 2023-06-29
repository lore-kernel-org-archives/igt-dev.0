Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B91610E108
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 06:55:39 +0000 (UTC)
Message-ID: <ed597eb4-9001-688b-17f4-30634c7c8f23@intel.com>
Date: Thu, 29 Jun 2023 08:55:29 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230629064807.557491-1-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230629064807.557491-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_vm: Fix missing jiffies ->
 nanoseconds conversion
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


On 29.06.2023 08:48, Zbigniew Kempczyński wrote:
> In the commit 471bfababd070e1dac0ebb87470ac4f2ae85e663 I changed
> timeout granularity from ms -> ns, but I missed one occurence.
> Fix this as we need to want to stop using jiffies in xe wait
> user fence.

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 12ecd17fa4..04d6c39568 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -357,7 +357,7 @@ static void *vm_async_ops_err_thread(void *data)
>   		.op = DRM_XE_UFENCE_WAIT_NEQ,
>   		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
>   		.mask = DRM_XE_UFENCE_WAIT_U32,
> -		.timeout = 1000,
> +		.timeout = MS_TO_NS(1000),
>   	};
>   
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
