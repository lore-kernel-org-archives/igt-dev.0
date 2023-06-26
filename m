Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638510E23C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:16:45 +0000 (UTC)
Date: Mon, 26 Jun 2023 18:16:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230626161637.okqofrxuncw33elh@kamilkon-desk1>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <20230626051031.2363120-15-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626051031.2363120-15-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V4 i-g-t 14/24] tests/chamelium: Use
 drm_close_driver() to close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,
On 2023-06-26 at 10:40:21 +0530, Bhanuprakash Modem wrote:
> To close the drm file descriptor, use igt helper drm_close_driver()
> instead of using close().
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/chamelium/kms_chamelium_audio.c  | 2 +-
>  tests/chamelium/kms_chamelium_edid.c   | 2 +-
>  tests/chamelium/kms_chamelium_frames.c | 2 +-
>  tests/chamelium/kms_chamelium_hpd.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
> index 6c6177fc5..8fbc1f80e 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -870,6 +870,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 4a52e6922..446bbd204 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -585,6 +585,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index 22a7ba936..a56afada4 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -1102,6 +1102,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
> index efd40ba54..8b3189ca0 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -564,6 +564,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> -- 
> 2.40.0
> 
