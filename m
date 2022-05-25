Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61E810FAAD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 10:27:45 +0000 (UTC)
Message-ID: <b88a6d13-493d-d747-177c-8766fb893b94@intel.com>
Date: Wed, 25 May 2022 15:57:41 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20220520011226.24017-1-nidhi1.gupta@intel.com>
 <20220520011226.24017-3-nidhi1.gupta@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220520011226.24017-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_invalid_mode: sanitize the
 system state between subtests
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

Hi Nidhi,

Please refer this https://cbea.ms/git-commit/
For subj add space before colon.
And we can have simple subject "IGT cleanup"
You can add this is commit message.

On 20-May-22 6:42 AM, Nidhi Gupta wrote:
> Before running the subtest we need to sanitize the system state
> to default, since we can't trust the state of previous subtest, used
> igt_display_reset() to sanitize the state.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_invalid_mode.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index bb524037..8115f7fd 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -222,6 +222,7 @@ test_output(data_t *data)
>   
>   static void test(data_t *data)
>   {
> +	igt_display_reset(&data->display);
>   	int valid_connectors = 0;
>   
>   	for_each_connected_output(&data->display, data->output) {

-- 
~Swati Sharma
