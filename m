Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4D189ABE
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 08:18:28 +0000 (UTC)
Date: Mon, 1 Jun 2020 11:18:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200601081826.GF9497@platvala-desk.ger.corp.intel.com>
References: <20200530011613.45991-1-jose.souza@intel.com>
 <20200530011613.45991-2-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530011613.45991-2-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_su: Print debugfs
 when skipping test
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

On Fri, May 29, 2020 at 06:16:13PM -0700, Jos=E9 Roberto de Souza wrote:
> This tests is being sporadically skipped in CI as it is not due
> "PSR sink not reliable: yes" lets print the i915_edp_psr_status to
> find out the reason.
> This can be reverted afterwards.
> =

> Reference: https://gitlab.freedesktop.org/drm/intel/-/issues/1911
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/igt_psr.c       | 13 +++++++++++++
>  lib/igt_psr.h       |  1 +
>  tests/kms_psr2_su.c |  2 ++
>  3 files changed, 16 insertions(+)
> =

> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 956f6219c..8c2f4ce6c 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -229,3 +229,16 @@ bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_b=
locks)
>  {
>  	return igt_wait(psr2_read_last_num_su_blocks_val(debugfs_fd, num_su_blo=
cks), 40, 1);
>  }
> +
> +void psr_print_debugfs(int debugfs_fd)
> +{
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +
> +	ret =3D igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> +				      sizeof(buf));
> +	if (ret < 0)
> +		return;
> +
> +	igt_debug("%s", buf);

Does the buf always have a newline here? Even when the file has
exactly PSR_STATUS_MAX_LEN bytes?


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
