Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9257891FB
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Sep 2021 12:37:56 +0000 (UTC)
References: <20210914112559.556898-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <3916cedc-6097-a405-f2e6-33a1e920599d@intel.com>
Date: Tue, 14 Sep 2021 18:07:51 +0530
MIME-Version: 1.0
In-Reply-To: <20210914112559.556898-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color_chamelium: Skip CTM
 test if property is not present
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM. However, we need to add fixes tag. Once bug is filed; can you please
float another version with that tag?

Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 14-Sep-21 4:55 PM, Bhanuprakash Modem wrote:
> CRTC property "CTM" is required for all CTM tests.
> 
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_color_chamelium.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
> index bc4356bfa..7173bc69e 100644
> --- a/tests/kms_color_chamelium.c
> +++ b/tests/kms_color_chamelium.c
> @@ -398,6 +398,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   	struct chamelium_port *port;
>   	char *connected_ports[4];
>   
> +	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> +
>   	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
>   	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
>   
> 

-- 
~Swati Sharma
