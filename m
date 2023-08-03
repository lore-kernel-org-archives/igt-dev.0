Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6EA10E5CE
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 08:30:26 +0000 (UTC)
Date: Thu, 3 Aug 2023 10:30:18 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20230803103018.20ed8059@maurocar-mobl2>
In-Reply-To: <20230803082134.3039513-2-katarzyna.dec@intel.com>
References: <20230803082134.3039513-1-katarzyna.dec@intel.com>
 <20230803082134.3039513-2-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/intel-ci: Add detailed
 description to blocked tests
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

On Thu,  3 Aug 2023 08:21:34 +0000
Katarzyna Dec <katarzyna.dec@intel.com> wrote:

> Update of description of blocked tests:
> * mock DRM KUnit:
> 	igt@dmabuf.*
> 	igt@drm_buddy
> 	igt@drm_mm
> 	igt@kms_selftest.*
> * test blocked as KMD not ready
> 	igt@xe_sysfs*
> 
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/intel-ci/xe.blocklist.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index b40dd4f70..2398acf3d 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -21,7 +21,8 @@ igt@gen.*
>  igt@perf.*
>  igt@sysfs_.*
>  ##################################################################
> -# Exclude kselftest
> +# Exclude mock DRM KUnit from IGT, as those already run at build
> +# time on Intel CI
>  #################################################################
>  igt@dmabuf.*
>  igt@drm_buddy
> @@ -81,5 +82,8 @@ igt@kms_getfb@.*-ccs
>  igt@kms_plane_lowres@tiling-(4|x|y|yf)
>  igt@kms_.*@.*hang.*
>  ##################################################################
> +# xe_sysfs tests are blocked due to KMD not ready yet
> +# To be UNBLOCKED after KMD is merged
> +##################################################################
>  igt@xe_sysfs*
>  ##################################################################
