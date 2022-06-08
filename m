Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE70F112890
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 15:37:32 +0000 (UTC)
Message-ID: <5b6dd565-4bb7-0d84-cad6-0105db799ba4@intel.com>
Date: Wed, 8 Jun 2022 21:07:28 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
 <20220517120245.3521494-11-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220517120245.3521494-11-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 10/11] tests/kms_dither: Rename dynamic tests
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

LGTM
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>


On 17-May-22 5:32 PM, Bhanuprakash Modem wrote:
> Instead of using dynamic subtests as <output name>-<pipe name>,
> update as <pipe name>-<output name>.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_dither.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index 21c1618a..c72f83be 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -210,7 +210,8 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   
>   		for_each_pipe(display, pipe) {
>   			if (igt_pipe_connector_valid(pipe, output)) {
> -				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
> +				igt_dynamic_f("pipe-%s-%s",
> +					      kmstest_pipe_name(pipe), output->name)
>   					test_dithering(data, pipe, output, fb_bpc,
>   							fb_format, output_bpc);
>   

-- 
~Swati Sharma
