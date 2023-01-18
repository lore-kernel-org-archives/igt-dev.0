Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9610E817
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 19:57:17 +0000 (UTC)
Date: Wed, 18 Jan 2023 20:57:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230118195713.cx7dzf6bjqnevrh6@kamilkon-desk1>
References: <20230118145757.14070-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230118145757.14070-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fixed the usage of
 Dereferencing of null pointer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-18 at 20:27:57 +0530, Mohammed Thasleem wrote:
> Fixed the usage of Dereferencing of null pointer to avoid crash.
-------------------- ^
Please make it lowercase, s/D/d/

Correct it also in your Subject.

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  lib/igt_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b4a98ae1..b3334b3a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1941,6 +1941,7 @@ kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
>  	int i;
>  
>  	proplist = drmModeObjectGetProperties(drm_fd, object_id, object_type);
> +	igt_require(proplist);
------- ^
imho just return false here, so

	if (!proplist)
		return false;

Regards,
Kamil

>  	for (i = 0; i < proplist->count_props; i++) {
>  		_prop = drmModeGetProperty(drm_fd, proplist->props[i]);
>  		if (!_prop)
> -- 
> 2.25.1
> 
