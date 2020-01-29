Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B96F460
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 07:07:43 +0000 (UTC)
From: "Saarinen, Jani" <jani.saarinen@intel.com>
Date: Wed, 29 Jan 2020 07:07:41 +0000
Message-ID: <b3614807914c4777afbf7aac75494150@intel.com>
References: <20200127144554.11364-1-mika.kahola@intel.com>
In-Reply-To: <20200127144554.11364-1-mika.kahola@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Fix CRC mismatch
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
To: "Kahola, Mika" <mika.kahola@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi, 

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mika
> Kahola
> Sent: maanantai 27. tammikuuta 2020 16.46
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 0/2] Fix CRC mismatch
> 
> On newer gens we experience CRC mismatch errors. These are caused by
> comparison between HDR and SDR planes. This patch series proposes a fix that
> compares HDR primary plane to HDR overlay planes and SDR primary plane to SDR
> overlay planes.
> 
> Yf tiling is not supported by GEN12. We should intentionally skip a test with that
> tiling mode.
> 
> Mika Kahola (2):
>   tests/kms_plane_lowres: Skip Yf tiling tests from gen12 onwards
>   tests/kms_plane_lowres: Fix CRC mismatch

Series:
Tested-by: Jani Saarinen <jani.saarinen@intel.com>

> 
>  tests/kms_plane_lowres.c | 147 ++++++++++++++++++++++++---------------
>  1 file changed, 90 insertions(+), 57 deletions(-)
> 
> --
> 2.17.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
