Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622A16E94A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Dec 2020 05:20:56 +0000 (UTC)
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue, 8 Dec 2020 05:20:50 +0000
Message-ID: <bb5e50432af4423b8e0bdd99af3f2f22@intel.com>
References: <20201208044900.19480-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20201208044900.19480-1-pankaj.laxminarayan.bharadiya@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/3] Add FB_DAMAGE_CLIPS prop and new
 test for Selective fetch
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
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Sent: 08 December 2020 10:19
> To: Mun, Gwan-gyeong <gwan-gyeong.mun@intel.com>; igt-
> dev@lists.freedesktop.org; Souza, Jose <jose.souza@intel.com>
> Cc: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Subject: [PATCH i-g-t v2 0/3] Add FB_DAMAGE_CLIPS prop and new test for
> Selective fetch
> 
> Add new test for PSR2 selective fetch
> 
> Pankaj Bharadiya (3):
>   INTEL_DII: lib/igt_psr: Add function to check PSR2 selective fetch
>   INTEL_DII: tests/kms_psr2_su: Add new selective update test

I accidentally sent wrong patchset.
please ignore this series, will resend v2.

Thanks,
Pankaj

>   INTEL_DII: tests: Add new PSR2 selective fetch test
> 
>  lib/igt_psr.c          |  10 +
>  lib/igt_psr.h          |   1 +
>  tests/Makefile.sources |   1 +
>  tests/kms_psr2_sf.c    | 649 +++++++++++++++++++++++++++++++++++++++++
>  tests/kms_psr2_su.c    |  29 +-
>  tests/meson.build      |   1 +
>  6 files changed, 688 insertions(+), 3 deletions(-)  create mode 100644
> tests/kms_psr2_sf.c
> 
> --
> 2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
