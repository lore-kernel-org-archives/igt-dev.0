Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15B6E479
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 06:08:20 +0000 (UTC)
References: <20210609121733.16461-1-venkata.sai.patnana@intel.com>
 <20210609121733.16461-9-venkata.sai.patnana@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <1a07553c-b367-5ab4-2692-cce017a95a92@intel.com>
Date: Thu, 10 Jun 2021 11:37:57 +0530
MIME-Version: 1.0
In-Reply-To: <20210609121733.16461-9-venkata.sai.patnana@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 09/11] tests/kms_dp_dsc: Read the
 debugfs only once
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 6/9/2021 5:47 PM, venkata.sai.patnana@intel.com wrote:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
>
> Instead of doing a debugfs_simple_read and then
> a debugfs_read(), lets read the debugfs node just once.
> We anyway get the suitable return from the following
> strstr operation
>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Navare Manasi D <manasi.d.navare@intel.com>
> ---
>   tests/kms_dp_dsc.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
> index 2446fd82bb..8bd2102447 100644
> --- a/tests/kms_dp_dsc.c
> +++ b/tests/kms_dp_dsc.c
> @@ -80,8 +80,6 @@ static bool is_dp_dsc_supported(data_t *data)
>   
>   	strcpy(file_name, data->conn_name);
>   	strcat(file_name, "/i915_dsc_fec_support");
> -	igt_require(igt_debugfs_simple_read(data->debugfs_fd, file_name, buf,
> -					    sizeof(buf)) > 0);
>   	igt_debugfs_read(data->drm_fd, file_name, buf);
>   
>   	return strstr(buf, "DSC_Sink_Support: yes");


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
