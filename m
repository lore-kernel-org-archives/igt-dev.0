Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61EE10E4FC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 16:18:01 +0000 (UTC)
Date: Wed, 2 Nov 2022 17:17:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20221102171754.2796171c@maurocar-mobl2>
In-Reply-To: <20221012110203.644576-3-janusz.krzysztofik@linux.intel.com>
References: <20221012110203.644576-1-janusz.krzysztofik@linux.intel.com>
 <20221012110203.644576-3-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/core_hotunplug: Always check
 device health after late close
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

On Wed, 12 Oct 2022 13:02:03 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Subtests hotrebind and hotreplug perform post-operation device healthcheck
> while keeping an old instance of the device still open.  If that
> healthcheck succeeds, the subtest deliberately returns success, without
> closing that old device instance first, so potential issues when closing
> it don't contribute to those subtests' results (we have dedicated subtests
> -- hotrebind-lateclose and hotreplug-lateclose -- focused on that step).
> Next, recover() function called from a follow-up igt_fixture section only
> closes the old device, without re-checking whether the new device is still
> healthy thereafter.  As a consequence, next tasks may be executed in an
> insane environment.
> 
> Teach recover() to perform additional healthckech right after device close
> if preceding subtest succeeded but left the device open.  Since next
> recovery steps can recognize potential failure of that healthcheck by
> non-NULL error message passed back, safely ignore the healtheck return
> value.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

LGTM.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/core_hotunplug.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 68fd92238c..ebb646b50f 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -463,8 +463,13 @@ static void pre_check(struct hotunplug *priv)
>  
>  static void recover(struct hotunplug *priv)
>  {
> +	bool late_close = priv->fd.drm >= 0;
> +
>  	cleanup(priv);
>  
> +	if (!priv->failure && late_close)
> +		igt_ignore_warn(healthcheck(priv, false));
> +
>  	/* unbind the driver from a possibly hot rebound unhealthy device */
>  	if (!faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0) &&
>  	    priv->fd.drm == -1 && priv->fd.drm_hc == -1 && priv->failure)
