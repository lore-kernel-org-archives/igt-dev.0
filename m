Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A2810E13E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 05:42:15 +0000 (UTC)
Message-ID: <a75bf2d9-46b7-1963-fb10-4695094e478a@intel.com>
Date: Thu, 8 Jun 2023 11:12:03 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220430014347.94210-1-mohammed.thasleem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20220430014347.94210-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: Terminate lease on bad
 connector id
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

Hi Thasleem,

I think we should have terminate lease in igt_fixture where we have 
igt_display_fini and all.

There are many places where lease->fd remains open, during different 
asserts, skip_ons throughout the test.

Regards,

Ankit

On 4/30/2022 7:13 AM, Mohammed Thasleem wrote:
> igt_skip_on make resource busy for sub sequence tests.
> To avoid this terminate the lease on bad connector id.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_lease.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 29a774ae8..03538cf8c 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -682,6 +682,10 @@ static void lease_unleased_connector(data_t *data)
>   			bad_connector_id = data->master.display.outputs[o].id;
>   	}
>   
> +	/* Terminate lease on bad connector id before skip. */
> +	if (bad_connector_id == 0)
> +		terminate_lease(&lease);

Perhaps we can add igt_skip("Couldnt find another connector"); in the if 
block only.

This scenario can happen in another subtest as well

> +
>   	/* Give up if there isn't another connector */
>   	igt_skip_on(bad_connector_id == 0);
>   
