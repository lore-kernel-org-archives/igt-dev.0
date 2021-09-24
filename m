Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6876EE01
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Sep 2021 11:16:12 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Fri, 24 Sep 2021 11:16:08 +0000
Message-ID: <1b1f8b0d26794ea387d160cb88907d97@intel.com>
References: <20210924100315.1895668-1-jigar.bhatt@intel.com>
 <20210924100315.1895668-2-jigar.bhatt@intel.com>
In-Reply-To: <20210924100315.1895668-2-jigar.bhatt@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/i915/i915_pm_dc:
 Refactoring pwr_dmn_info to debugfs_dump
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Bhatt, Jigar" <jigar.bhatt@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Varide, Nischal" <nischal.varide@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Bhatt, Jigar <jigar.bhatt@intel.com>
> Sent: Friday, September 24, 2021 3:33 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Bhatt, Jigar <jigar.bhatt@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Varide, Nischal <nischal.varide@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t v2 1/2] tests/i915/i915_pm_dc: Refactoring pwr_dmn_=
info
> to debugfs_dump
Please fix the version number here.
With that.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> Refactoring pwr_dmn_info to debugfs_dump so other test can use it for
> dumping debugfs file.[Anshuman]
>=20
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> 9d0a15d8..04acf839 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -50,7 +50,7 @@ typedef struct {
>  	int msr_fd;
>  	int debugfs_fd;
>  	uint32_t devid;
> -	char *pwr_dmn_info;
> +	char *debugfs_dump;
>  	igt_display_t display;
>  	struct igt_fb fb_white, fb_rgb, fb_rgr;
>  	enum psr_mode op_psr_mode;
> @@ -217,7 +217,7 @@ static void check_dc_counter(data_t *data, int dc_fla=
g,
> uint32_t prev_dc_count)
>  		(dc_flag & CHECK_DC5 ? "DC5" : "DC6"));
>  	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag,
> prev_dc_count),
>  		     "%s state is not achieved\n%s:\n%s\n", tmp,
> PWR_DOMAIN_INFO,
> -		     data->pwr_dmn_info =3D igt_sysfs_get(data->debugfs_fd,
> PWR_DOMAIN_INFO));
> +		     data->debugfs_dump =3D igt_sysfs_get(data->debugfs_fd,
> +PWR_DOMAIN_INFO));
>  }
>=20
>  static void setup_videoplayback(data_t *data) @@ -504,7 +504,7 @@ int
> main(int argc, char *argv[])
>  	}
>=20
>  	igt_fixture {
> -		free(data.pwr_dmn_info);
> +		free(data.debugfs_dump);
>  		close(data.debugfs_fd);
>  		close(data.msr_fd);
>  		display_fini(&data);
> --
> 2.25.1
