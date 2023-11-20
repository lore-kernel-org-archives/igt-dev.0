Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019210E0C5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 17:04:42 +0000 (UTC)
Message-ID: <0f83d645-e477-49ea-a6c1-9aaa5fc948a5@intel.com>
Date: Mon, 20 Nov 2023 22:34:03 +0530
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231120143635.105731-1-karthik.poosa@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231120143635.105731-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel: Add changes to use new
 sysfs frequency entries by xe
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

Hi Karthik

add the test prefix to the subject

tests/intel: Add changes to use new sysfs frequency entries by xe
            ^ xe_guc_pc                                     ^remove by xe


Thanks
Riana
On 11/20/2023 8:06 PM, Karthik Poosa wrote:
> Updated xe set_freq and get_freq definitions to use new sysfs entries.
> The new entries will be under sub-directory freq.
> Names of the entries have also changed. They will be suffixed with _freq
> i.e /device/tile<n>/gt<n>/freq/*_freq instead of prefix.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
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
