Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8004D10E3E1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 14:16:02 +0000 (UTC)
Message-ID: <6d5fbd57-d6eb-444b-9963-8fa36c9b82fb@intel.com>
Date: Mon, 20 Nov 2023 19:45:47 +0530
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231120135344.4182454-1-anshuman.gupta@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231120135344.4182454-1-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] test/intel/xe_guc_pc: Add debug message
 for gt freq
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


Hi Anshuman

On 11/20/2023 7:23 PM, Anshuman Gupta wrote:
> Adding a igt_debug() message for gt freq, it will be
> useful to debug the xe_guc_pc igt test failures.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/intel/xe_guc_pc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
> index fa2f20cca..37c6fd9e0 100644
> --- a/tests/intel/xe_guc_pc.c
> +++ b/tests/intel/xe_guc_pc.c
> @@ -166,6 +166,8 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
>   	while (err == -EAGAIN)
>   		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
>   
> +	igt_debug("gt%d: %s freq\n", gt_id, freq_name);
should print freq read as well?
it will be useful for tests that are failing on comparison

Thanks
Riana
> +
>   	close(gt_fd);
>   	return freq;
>   }
