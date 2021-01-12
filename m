Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266B6E220
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 13:27:20 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 12 Jan 2021 13:27:17 +0000
Message-ID: <200e8710e3874ee2bd27b9e89861892b@intel.com>
References: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
 <20210109191013.9858-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210109191013.9858-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] HAX remove rotation tests from
 blacklist
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Saturday, January 9, 2021 9:10 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 2/2] HAX remove rotation tests from blacklist
> 
> HAX remove rotation tests from blacklist
> ---
>  tests/intel-ci/blacklist-pre-merge.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-
> merge.txt
> index cddb77c1f..b46c7d050 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -17,7 +17,7 @@
>  #
>  # Data acquired on 2020-02-19 by Martin Peres
> ################################################################
> ###############
> -igt@kms_rotation_crc@.*
> +#igt@kms_rotation_crc@.*
> 
> 
> 
> ################################################################
> ###############
> --
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
