Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5372D10E38A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 09:18:07 +0000 (UTC)
Date: Tue, 7 Mar 2023 10:18:03 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230307101803.3a10b251@maurocar-mobl2>
In-Reply-To: <20230302110947.548610-4-zbigniew.kempczynski@intel.com>
References: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
 <20230302110947.548610-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/8] lib/igt_pm: Add a helper to
 query the runtime_usage.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu,  2 Mar 2023 12:09:42 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> It will be useful so the tests can assert the expected
> usage counter movement depending on the operation.
>=20
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_pm.c | 18 ++++++++++++++++++
>  lib/igt_pm.h |  1 +
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 6c84e94f63..704acf7d14 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1363,3 +1363,21 @@ int igt_pm_get_runtime_suspended_time(struct pci_d=
evice *pci_dev)
> =20
>  	return -1;
>  }
> +
> +/**
> + * igt_pm_get_runtime_usage:
> + * @pci_dev: pci device
> + *
> + * Reports the runtime PM usage count of a device.
> + */
> +int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
> +{
> +	char usage_str[64];
> +	int usage, fd;
> +
> +	fd =3D igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_usage");
> +	if (igt_pm_read_power_attr(fd, usage_str, 64, true))
> +		igt_assert(sscanf(usage_str, "%d", &usage) > 0);
> +
> +	return usage;
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index f65b960c38..d0d6d673e8 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -86,5 +86,6 @@ void igt_pm_restore_pci_card_runtime_pm(void);
>  void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled(int fd);
>  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
> =20
>  #endif /* IGT_PM_H */
