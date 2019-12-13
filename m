Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114F56E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 02:21:23 +0000 (UTC)
Date: Thu, 12 Dec 2019 18:22:44 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20191213022244.GH24342@intel.com>
References: <20191212062622.12608-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212062622.12608-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: Skip the
 test when all the tiled connectors are not connected
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 11:56:22AM +0530, Karthik B S wrote:
> The test expects all the tiled connectors to be connected for execution.
> If all the tiled connectors are not connected, then skip the test.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  tests/kms_dp_tiled_display.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index 175ff12..6bde7cf 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -159,6 +159,8 @@ static void get_connectors(data_t *data)
>  
>  		count++;
>  	}
> +	igt_require_f(count == data->num_h_tiles,
> +		     "All the tiled connectors are not connected\n");
>  }
>  
>  static void
> -- 
> 2.7.4
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
