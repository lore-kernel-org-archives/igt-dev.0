Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273CA10E1C1
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 16:19:33 +0000 (UTC)
Date: Wed, 19 Apr 2023 18:19:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <20230419161923.dswjjoakp2cp3alb@zkempczy-mobl2>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <ZD7MIIwPHu+eM8ZR@intel.com>
 <20230419070151.ezivqrifp2qk6q7o@zkempczy-mobl2>
 <bd850ded-b4b7-dd17-ea3a-8433557c3b54@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd850ded-b4b7-dd17-ea3a-8433557c3b54@intel.com>
Subject: Re: [igt-dev] [i-g-t 00/45] Add IGT display support for XE
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

On Wed, Apr 19, 2023 at 05:27:24PM +0530, Modem, Bhanuprakash wrote:
<cut>

> @Zbigniew, How about moving xe_device_get() to drm_open_driver()?
> So that, no need to call xe_device_get() in test level.
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -601,6 +601,9 @@ int drm_open_driver(int chipset)
>                 }
>         }
> 
> +       if (is_xe_device(fd))
> +               xe_device_get(fd);
> +
>         return fd;
>  }
> 
> Ofcourse we need some efforts to handle xe_device_put():
> 1- Create a new helper maybe drm_close(fd)
> 	drm_close(int fd) {
> 		if (is_xe_device(fd))
> 			xe_device_put(fd);
> 
> 		close(fd);
> 	}
> 2- Update both kms & gem tests to use s/close(fd)/drm_close(fd)/
> 
> - Bhanu
> 

I got no strong preference to call this helper but if you plan to
do so I think  __drm_open_driver_another() is better place to put
this into. I mean with using filters you can omit drm_open_driver().
And yes, drm_close() might need to be added also to call freeing
helper.

Just try out, let's see what will happen on CI. I don't think
you'll regress i915, only xe path may need some tweaks.

--
Zbigniew
