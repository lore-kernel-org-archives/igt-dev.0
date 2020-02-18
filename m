Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F193F89FA9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 18:47:11 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
 <20200217142155.501499-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200217142155.501499-2-lionel.g.landwerlin@intel.com>
Message-ID: <158205162722.8112.17428517313934366262@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 18:47:07 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] lib/intel_chipset: identify Elkhart
 Lake
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-02-17 14:21:50)
> We'll need to identify this platform for performance tools.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  lib/intel_chipset.h     | 1 +
>  lib/intel_device_info.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 2bd57f4f..929fac53 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -71,6 +71,7 @@ struct intel_device_info {
>         bool is_cometlake : 1;
>         bool is_cannonlake : 1;
>         bool is_icelake : 1;
> +       bool is_elkhartlake : 1;
>         bool is_tigerlake : 1;
>         const char *codename;
>  };
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 4f96577d..07eeb7c5 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -309,6 +309,12 @@ static const struct intel_device_info intel_icelake_info = {
>         .codename = "icelake"
>  };
>  
> +static const struct intel_device_info intel_elkhartlake_info = {
> +       .gen = BIT(10),
> +       .is_elkhartlake = true,
> +       .codename = ""

.codename = "elkhartlake"

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
