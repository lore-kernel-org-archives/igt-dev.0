Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB7410E140
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 21:26:55 +0000 (UTC)
Message-ID: <cd8c0bf6-30a4-47f5-9eff-fe9d0e554cbd@amd.com>
Date: Thu, 24 Aug 2023 15:26:45 -0600
To: Melissa Wen <mwen@igalia.com>, igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20230824161524.14083-1-mwen@igalia.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230824161524.14083-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic: remove zpos <
 N-planes assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/24/23 10:15, Melissa Wen wrote:
> Generalize plane-immutable-zpos test case by removing not-required
> assert. zpos < N-planes is a condition not required by DRM
> documentation. Removing this validation doesn't affect the test purpose
> on verifying that planes with higher zpos always cover those with lower
> zpos. Also, this assert doesn't fit driver's configuration where the
> range of plane zpos is just defined by the plane type but its max value
> doesn't need to be normalized to the number of planes in a CRTC, for
> example, a cursor plane with the highest possible zpos value.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_atomic.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 22ddf5633..6986864f3 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -458,7 +458,6 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>   			continue;
>   
>   		zpos = igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
> -		igt_assert_lt(zpos, n_planes);
>   
>   		plane_ptr[zpos] = temp;
>   	}

lgtm,
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
