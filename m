Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5D46E233
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 10:46:08 +0000 (UTC)
Date: Mon, 1 Jun 2020 16:16:08 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200601104608.GB20219@intel.com>
References: <20200601084000.31583-1-ankit.k.nautiyal@intel.com>
 <20200601084000.31583-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601084000.31583-3-ankit.k.nautiyal@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t 2/2] tests/kms_content_protection: Remove
 pre-existing SRM table before the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org, jani.nikula@intel.com, petri.latvala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-06-01 at 14:10:00 +0530, Ankit Nautiyal wrote:
> This is to check the case with missing SRM, which should be treated as
> device with no revoked keys.
> 
> Kernel patch fixing such a bug :
> https://patchwork.freedesktop.org/patch/361346/?series=75939&rev=2
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tests/kms_content_protection.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index a6a64a28..832c9077 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -75,6 +75,8 @@ __u8 facsimile_srm[] = {
>  	0x83, 0xAA, 0xC2, 0x5B, 0x24, 0xB3, 0x36, 0x84, 0x94, 0x75, 0x34, 0xDB,
>  	0x10, 0x9E, 0x3B, 0x23, 0x13, 0xD8, 0x7A, 0xC2, 0x30, 0x79, 0x84};
>  
> +const char *srm_fw = "/lib/firmware/display_hdcp_srm.bin";
> +
>  static void flip_handler(int fd, unsigned int sequence, unsigned int tv_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -438,8 +440,7 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
>  {
>  	int fd, ret, total = 0;
>  
> -	fd = open("/lib/firmware/display_hdcp_srm.bin",
> -		  O_WRONLY | O_CREAT, S_IRWXU);
> +	fd = open(srm_fw, O_WRONLY | O_CREAT, S_IRWXU);
>  	do {
>  		ret = write(fd, srm + total, len - total);
>  		if (ret < 0)
> @@ -783,6 +784,11 @@ igt_main
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  
>  		igt_display_require(&data.display, data.drm_fd);
> +
> +		/* Remove pre-existing srm table */
> +		if (access(srm_fw, F_OK) == 0)
> +			igt_assert_f(!remove(srm_fw),
> +				     "Failed to delete previous srm table\n");
Looks good to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(hdcp_protocol); i++) {
> -- 
> 2.17.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
