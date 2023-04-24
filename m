Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5AC10E12B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 16:49:55 +0000 (UTC)
Message-ID: <2e34a61e-4006-1cf7-fd4c-7578413a2e14@amd.com>
Date: Mon, 24 Apr 2023 10:49:49 -0600
Content-Language: en-US
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com
References: <20230424134845.67398-1-hersenxs.wu@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230424134845.67398-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_hotplug: add delay
 after igt_system_suspend_autoresume
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



On 4/24/23 07:48, Hersen Wu wrote:
> at call back of igt_system_suspend_autoresume, linux kernel resume
> finish and in d0 state. but user mode components may not be fully
> out of sleep mode. add delay wait for system stable before issuing
> debugfs_hotplug_trigger.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_hotplug.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 736040a2..1c946ff8 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -133,6 +133,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
>   	if (suspend) {
>   		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>   					      SUSPEND_TEST_NONE);
> +		sleep(30);

Do we need to wait all of this time? If so, why?

>   	}
>   
>   	/* Trigger hotplug and confirm reference image is the same. */
