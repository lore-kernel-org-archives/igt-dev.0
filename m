Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220AC6EF2A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2020 15:01:14 +0000 (UTC)
Date: Wed, 29 Apr 2020 18:00:40 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200429150040.GD5618@ideak-desk.fi.intel.com>
References: <20200408201925.31566-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408201925.31566-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_fbcon_fbt: Make FBC
 wait_until_update() more reliable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 01:19:24PM -0700, Jos=E9 Roberto de Souza wrote:
> We can't depend onto debugfs reads of the FBC status as compression
> takes one idle frame to recompress and we could easily miss that.
> =

> Instead lets use the pipe CRC as it keeps the CRC of each frame so we
> can compare each other until a blink in the FBCON causes it do change.
> =

> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/igt_debugfs.c     | 13 +++++++++++--
>  lib/igt_debugfs.h     |  1 +
>  tests/kms_fbcon_fbt.c | 39 ++++++++++++++++++++++++++++++---------
>  3 files changed, 42 insertions(+), 11 deletions(-)
> =

> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index bf6be552..9e6c5c99 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -368,8 +368,17 @@ bool igt_debugfs_search(int device, const char *file=
name, const char *substring)
>   * Pipe CRC
>   */
>  =

> -static bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b,
> -				  int *index)
> +/**
> + * igt_find_crc_mismatch:
> + * @a: first pipe CRC value
> + * @b: second pipe CRC value
> + * @index: index of the first value that mismatched
> + *
> + * Check if CRC a and CRC b mismatch.
> + *
> + * Returns true if CRC values mismatch, false otherwise;
> + */
> +bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *=
index)
>  {
>  	int nwords =3D min(a->n_words, b->n_words);
>  	int i;
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index 7d1a6175..722c5cc3 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -85,6 +85,7 @@ typedef struct {
>  #define INTEL_PIPE_CRC_SOURCE_AUTO "auto"
>  #define AMDGPU_PIPE_CRC_SOURCE_DPRX "dprx"
>  =

> +bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *=
index);
>  void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
>  bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
>  char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc=
_size);
> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index c2361730..546dff99 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -142,13 +142,31 @@ static bool fbc_wait_until_disabled(int debugfs_fd)
>  	return r;
>  }
>  =

> -static bool fbc_not_compressing_enabled(int debugfs_fd)
> +static bool fbc_check_cursor_blinking(struct drm_info *drm)
>  {
> -	char buf[128];
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t crc[2];
> +	bool ret;
> +	int i;
>  =

> -	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
> -				sizeof(buf));
> -	return strstr(buf, "FBC enabled\nCompressing: no");
> +	pipe_crc =3D igt_pipe_crc_new(drm->fd, PIPE_A, INTEL_PIPE_CRC_SOURCE_AU=
TO);

There doesn't seem to be a way to find the actual pipe for fbcon, but
since nothing else is enabled here, it's a reasonable assumption:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> +
> +	igt_pipe_crc_start(pipe_crc);
> +	igt_pipe_crc_drain(pipe_crc);
> +
> +	for (i =3D 0; i < 60; i++) {
> +		igt_pipe_crc_get_single(pipe_crc, &crc[i % 2]);
> +
> +		if (i > 0) {
> +			ret =3D igt_find_crc_mismatch(&crc[0], &crc[1], NULL);
> +			if (ret)
> +				break;
> +		}
> +	}
> +	igt_pipe_crc_stop(pipe_crc);
> +	igt_pipe_crc_free(pipe_crc);
> +
> +	return ret;
>  }
>  =

>  static bool fbc_wait_until_update(struct drm_info *drm)
> @@ -161,11 +179,14 @@ static bool fbc_wait_until_update(struct drm_info *=
drm)
>  	 * For older GENs FBC is still expected to be disabled as it still
>  	 * relies on a tiled and fenceable framebuffer to track modifications.
>  	 */
> -	if (AT_LEAST_GEN(drm->devid, 9))
> -		return igt_wait(fbc_not_compressing_enabled(drm->debugfs_fd),
> -				2500, 1);
> -	else
> +	if (AT_LEAST_GEN(drm->devid, 9)) {
> +		if (!fbc_wait_until_enabled(drm->debugfs_fd))
> +			return false;
> +
> +		return fbc_check_cursor_blinking(drm);
> +	} else {
>  		return fbc_wait_until_disabled(drm->debugfs_fd);
> +	}
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
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
