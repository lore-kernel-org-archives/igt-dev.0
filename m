Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660956E12C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 18:11:54 +0000 (UTC)
Date: Tue, 7 Apr 2020 21:11:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200407181128.GL6112@intel.com>
References: <20200407163525.75416-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407163525.75416-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/2] tests/kms_fbcon_fbt: Reduce
 execution time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 09:35:24AM -0700, Jos=E9 Roberto de Souza wrote:
> Every time fbc_wait_until_enabled() is called from
> fbc_wait_until_update() it was waiting the whole 5 seconds of timeout
> to return false as expected.
> To save most 99% of this adding here fbc_wait_until_disabled().

5s seems a bit excessive in any case.

> =

> v5:
> - Fixed fbc_wait_until_update() test
> =

> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_fbcon_fbt.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> =

> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index ed4cccbe..b8000a24 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -113,18 +113,28 @@ static void fbc_print_status(int debugfs_fd)
>  	igt_debug("FBC status: %s\n", buf);
>  }
>  =

> -static bool fbc_is_enabled(int debugfs_fd)
> +static bool fbc_check_status(int debugfs_fd, bool enabled)
>  {
>  	char buf[128];
>  =

>  	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
>  				sizeof(buf));
> -	return strstr(buf, "FBC enabled\n");
> +	if (enabled)
> +		return strstr(buf, "FBC enabled\n");
> +	else
> +		return strstr(buf, "FBC disabled");
>  }
>  =

>  static bool fbc_wait_until_enabled(int debugfs_fd)
>  {
> -	bool r =3D igt_wait(fbc_is_enabled(debugfs_fd), 5000, 1);
> +	bool r =3D igt_wait(fbc_check_status(debugfs_fd, true), 5000, 1);
> +	fbc_print_status(debugfs_fd);
> +	return r;
> +}
> +
> +static bool fbc_wait_until_disabled(int debugfs_fd)
> +{
> +	bool r =3D igt_wait(fbc_check_status(debugfs_fd, false), 5000, 1);
>  	fbc_print_status(debugfs_fd);
>  	return r;
>  }
> @@ -141,7 +151,7 @@ static bool fbc_wait_until_update(int debugfs)
>  	 * If one day fbcon starts to use a tiled framebuffer we would need to
>  	 * check the 'Compressing' status as in each blink it would be disabled.
>  	 */
> -	return !fbc_wait_until_enabled(debugfs);
> +	return fbc_wait_until_disabled(debugfs);
>  }
>  =

>  typedef bool (*connector_possible_fn)(drmModeConnectorPtr connector);
> -- =

> 2.26.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
