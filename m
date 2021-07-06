Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAE76E0DD
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 13:37:13 +0000 (UTC)
Date: Tue, 6 Jul 2021 09:37:08 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210706133708.czi3meh53d4bkrjt@outlook.office365.com>
References: <20210701174424.2261499-1-markyacoub@chromium.org>
Content-Disposition: inline
In-Reply-To: <20210701174424.2261499-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] drmtest: Add is_msm_device check
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 07/01, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> Add support for MSM drivers.

I think you're not adding "support for MSM", it looks like you're adding
helpers to check msm driver. Anyway, this patch lgtm.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/drmtest.c | 5 +++++
>  lib/drmtest.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index a8ba6e11..e1f9b115 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -114,6 +114,11 @@ bool is_i915_device(int fd)
>  	return __is_device(fd, "i915");
>  }
>  
> +bool is_msm_device(int fd)
> +{
> +	return __is_device(fd, "msm");
> +}
> +
>  bool is_nouveau_device(int fd)
>  {
>  	/* Currently all nouveau-specific codepaths require libdrm */
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index d393dbf1..7d17a0f9 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -102,6 +102,7 @@ void igt_require_vc4(int fd);
>  
>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
> +bool is_msm_device(int fd);
>  bool is_nouveau_device(int fd);
>  bool is_vc4_device(int fd);
>  
> -- 
> 2.32.0.93.g670b81a890-goog
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
