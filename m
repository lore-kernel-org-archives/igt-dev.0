Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0176E079
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 16:29:11 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 08 Nov 2021 17:27:46 +0100
Message-ID: <5038674.0VBMTVartN@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
References: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/device_reset: remove artificial
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: lucas.demarchi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 8 November 2021 14:47:46 CET Marcin Bernatowicz wrote:
> Do not use artificial timeout. Let the test fail or finish.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/device_reset.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 982ba5ef2a..e60d4c7fde 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -301,8 +301,6 @@ igt_main
>  		set_device_filter(dev_path);
>  
>  		igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
> -
> -		igt_set_timeout(60, "device reset tests timed out after 
60s");
>  	}
>  
>  	igt_describe("Unbinds driver from device, initiates reset"
> @@ -319,7 +317,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		igt_reset_timeout();
>  		cleanup_device_fds(&dev);
>  	}
>  }
> 

I think it could still make sense from the CI point of view to time out if 
some uncommon steps preceding the scope of the exercise, e.g., driver unbind 
before the reset operation itself, would take too much time, but anyway, 
interrupting the exercised reset operation in the middle and not collecting as 
much of driver output as possible if the driver response is slow doesn't sound 
like a good idea, then

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>


