Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751B6EDF0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 10:35:40 +0000 (UTC)
Date: Wed, 10 Nov 2021 11:35:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211110103536.GA46415@zkempczy-mobl2>
References: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
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
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 01:47:46PM +0000, Marcin Bernatowicz wrote:
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
> -		igt_set_timeout(60, "device reset tests timed out after 60s");
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
> -- 
> 2.30.2
> 

Ok, we've discussed about this - if other vendors will complain 
in the future we will revert and skip setting this timeout on i915.
So:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
