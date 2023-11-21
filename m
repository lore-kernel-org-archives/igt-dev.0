Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF52E10E253
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 10:30:33 +0000 (UTC)
Message-ID: <fdca0735-34c1-46f8-95e3-616e4538f1a5@intel.com>
Date: Tue, 21 Nov 2023 16:00:18 +0530
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231120161348.6093-1-anshuman.gupta@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231120161348.6093-1-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] test/intel/xe_guc_pc: Add debug
 message for gt freq
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

The failures seem to be related to the folder change

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10220/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html


On 11/20/2023 9:43 PM, Anshuman Gupta wrote:
> Adding a igt_debug() message for gt freq, it will be
> useful to debug the xe_guc_pc igt test failures.
> 
> v2:
> - Add missed freq argument to igt_debug(). [Riana]
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_guc_pc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
> index fa2f20cca..d0ec0ee49 100644
> --- a/tests/intel/xe_guc_pc.c
> +++ b/tests/intel/xe_guc_pc.c
> @@ -166,6 +166,8 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
>   	while (err == -EAGAIN)
>   		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
>   
> +	igt_debug("gt%d: %s freq %u\n", gt_id, freq_name, freq);
> +
>   	close(gt_fd);
>   	return freq;
>   }
