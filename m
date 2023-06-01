Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75C610E047
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 07:15:27 +0000 (UTC)
Message-ID: <97f66f89-1b83-6c55-a3f4-6a5020cc360e@intel.com>
Date: Thu, 1 Jun 2023 12:45:21 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20230530133109.5735-1-juhapekka.heikkila@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230530133109.5735-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Fix special
 handling for Intel CHV
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

LGTM. Please add "Fixes" with gitlab issue# before merging.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 30-May-23 7:01 PM, Juha-Pekka Heikkila wrote:
> Match software rendering round to what hardware rendering round did
> on Intel CHV.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/kms_cursor_crc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3a353a03..61a0d65e 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -253,6 +253,10 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>   			igt_assert_crc_equal(hwcrc, &crc_after);
>   		}
>   	} else {
> +		/* If on broken situation on CHV match what hw round did */
> +		if (chv_cursor_broken(data, x) && cursor_visible(data, x, y))
> +			return;
> +
>   		/* Now render the same in software and collect crc */
>   		swbufidx = (data->primary->drm_plane->fb_id ==
>   			    data->primary_fb[SWCOMPARISONBUFFER1].fb_id) ?
