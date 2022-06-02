Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C810E462
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 09:19:39 +0000 (UTC)
Message-ID: <837b4f3d-3e3b-aa8b-2df0-0d5faf90c989@intel.com>
Date: Thu, 2 Jun 2022 14:49:27 +0530
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220601190556.26532-1-jeevan.b@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220601190556.26532-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: skip test if compatible
 mode is not found
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

On 6/2/2022 12:35 AM, Jeevan B wrote:
> skip test if the compatible mode is not found instead of
> forcing the first connector mode on to the other connector.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 5985e012..c5b5741a 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -950,8 +950,7 @@ static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
>   			}
>   		}
>   
> -		/* hope for the best! */
> -		*a = *b = c1->modes[0];
> +		igt_skip("Compatible mode not found.\n");
>   	}
>   
>   	return;

