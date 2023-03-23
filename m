Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA97610E11F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 14:32:08 +0000 (UTC)
Message-ID: <dbf697e9-c92b-7428-643a-1ab982805322@intel.com>
Date: Thu, 23 Mar 2023 20:01:40 +0530
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230315100657.3385384-1-kunal1.joshi@intel.com>
 <20230315100657.3385384-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230315100657.3385384-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/chamelium/kms_chamelium_edid: reset
 state before starting subtest
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
> In some subtests of kms_chamelium_edid we were trying
> to plug a port that could already be plugged, so
> reset chamelium state at the start
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/chamelium/kms_chamelium_edid.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index f7609932..e2b6c48f 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -190,6 +190,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
>   	int i;
>   	struct chamelium *chamelium = data->chamelium;
>   	struct udev_monitor *mon = igt_watch_uevents();
> +	chamelium_reset_state(&data->display, data->chamelium, port,
> +			      data->ports, data->port_count);
> +
>   
>   	for (i = 0; i < edids_list_len; ++i) {
>   		struct chamelium_edid *chamelium_edid;
