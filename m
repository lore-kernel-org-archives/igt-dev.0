Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831010E253
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 10:34:38 +0000 (UTC)
Message-ID: <d76b90be-8a6a-4caf-aa77-62a21a2a64c1@intel.com>
Date: Tue, 21 Nov 2023 16:04:21 +0530
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231121093908.144717-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231121093908.144717-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/intel/xe_guc_pc: Add changes
 to use new sysfs frequency entries
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



On 11/21/2023 3:09 PM, Karthik Poosa wrote:
> Updated xe set_freq and get_freq definitions to use new sysfs entries.
> The new entries will be under sub-directory freq.
> Names of the entries have also changed. They will be suffixed with _freq
> i.e /device/tile<n>/gt<n>/freq/*_freq instead of prefix.
> 
> v2: Updated commit message based on review comments. [Riana]
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_guc_pc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
> index fa2f20cca..bb6344449 100644
> --- a/tests/intel/xe_guc_pc.c
> +++ b/tests/intel/xe_guc_pc.c
> @@ -141,7 +141,7 @@ static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>   	char freq_attr[16];
>   	int gt_fd;
>   
> -	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
> +	snprintf(freq_attr, sizeof(freq_attr), "freq/%s_freq", freq_name);
>   	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>   	igt_assert(gt_fd >= 0);
>   
> @@ -159,7 +159,7 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
>   	char freq_attr[16];
>   	int gt_fd;
>   
> -	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
> +	snprintf(freq_attr, sizeof(freq_attr), "freq/%s_freq", freq_name);
>   	gt_fd = xe_sysfs_gt_open(fd, gt_id);
>   	igt_assert(gt_fd >= 0);
>   
