Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7CD89CA2
 for <igt-dev@lists.freedesktop.org>; Mon, 10 May 2021 13:24:59 +0000 (UTC)
From: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>
Date: Mon, 10 May 2021 13:24:56 +0000
Message-ID: <DM6PR11MB45943B2667321969EBE2663DB3549@DM6PR11MB4594.namprd11.prod.outlook.com>
References: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_mmap_write_crc: Add subtest
 description
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
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "B@freedesktop.org" <B@freedesktop.org>, "S@freedesktop.org" <S@freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Arundhati
> Hagaragi
> Sent: Friday, May 7, 2021 6:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: S@freedesktop.org; B@freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_mmap_write_crc: Add subtest
> description
> 
> Added description for subtest
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: B S, Karthik <karthik.b.s@intel.com>
> ---
>  tests/kms_mmap_write_crc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c index
> 46013808..a38ed231 100644
> --- a/tests/kms_mmap_write_crc.c
> +++ b/tests/kms_mmap_write_crc.c
> @@ -289,6 +289,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>  		igt_info("Using %d rounds for the test\n", ROUNDS);
> 
>  		for (i = 0; i < ROUNDS; i++)
> +		igt_describe("Tests that writing non-white to the fb and flip to it
> to make it fully"
> +				" UC/WC and make sure caching mode has
> become UC/WC");
>  			run_test(&data);
>  	}
> igt_describe need to be on top of for loop.
> --
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
