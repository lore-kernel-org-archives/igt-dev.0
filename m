Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1099210E489
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 14:32:49 +0000 (UTC)
Message-ID: <0bae1796-f894-ce7f-18d0-796b131bd300@intel.com>
Date: Thu, 23 Mar 2023 20:02:19 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230315100657.3385384-1-kunal1.joshi@intel.com>
 <20230315100657.3385384-3-kunal1.joshi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230315100657.3385384-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/chamelium/kms_chamelium_hpd: issue
 disabling modeset when for very plug/unplug cycle
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


On 3/15/2023 3:36 PM, Kunal Joshi wrote:
> It is known issue that we don't get hotplug with enabled
> mode on TypeC connector, issue a disabling modeset for
> every plug/unplug cycle
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/chamelium/kms_chamelium_hpd.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
> index d9718d76..2b17ce29 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -190,6 +190,7 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
>   						   DRM_MODE_DISCONNECTED);
>   
>   	for_each_pipe(&data->display, pipe) {
> +		igt_modeset_disable_all_outputs(&data->display);
>   		igt_flush_uevents(mon);
>   		/* Check if we get a sysfs hotplug event */
>   		chamelium_plug(data->chamelium, port);
