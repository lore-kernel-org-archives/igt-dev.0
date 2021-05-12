Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25DB6EB56
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 07:50:18 +0000 (UTC)
Date: Wed, 12 May 2021 10:51:36 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YJuJCN49NiLZdLFA@platvala-desk.ger.corp.intel.com>
References: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
 <20210512072157.3163214-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512072157.3163214-1-arundhati.hagaragi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_mmap_write_crc: Add
 subtest description
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
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 12, 2021 at 12:51:57PM +0530, Arundhati Hagaragi wrote:
> Added description for subtest
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: B S Karthik <karthik.b.s@intel.com>
> Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_mmap_write_crc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
> index 46013808..8bb30e23 100644
> --- a/tests/kms_mmap_write_crc.c
> +++ b/tests/kms_mmap_write_crc.c
> @@ -288,6 +288,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>  	igt_subtest("main") {
>  		igt_info("Using %d rounds for the test\n", ROUNDS);
>  
> +		igt_describe("Tests that caching mode has become UC/WT and flushed and also validat"
> +				"es mmap write to an uncached buffer ");

Please test the code that you change. Running the test with --describe
should print this text. It doesn't, because it's placed incorrectly
still. Not to mention this test will error out when trying to actually
execute the test.



-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
