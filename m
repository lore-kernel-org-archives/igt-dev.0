Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA089E11
 for <igt-dev@lists.freedesktop.org>; Thu,  6 May 2021 04:38:20 +0000 (UTC)
References: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20210504054027.12895-2-pankaj.laxminarayan.bharadiya@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <65178e43-ab1a-9dfe-0330-f53de1c1118e@intel.com>
Date: Thu, 6 May 2021 10:08:16 +0530
MIME-Version: 1.0
In-Reply-To: <20210504054027.12895-2-pankaj.laxminarayan.bharadiya@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_su: Add subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com, jose.souza@intel.com
Cc: kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 5/4/2021 11:10 AM, Pankaj Bharadiya wrote:
> Add description for all subtests.
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_psr2_su.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> index 9215c59d6..c709065f5 100644
> --- a/tests/kms_psr2_su.c
> +++ b/tests/kms_psr2_su.c
> @@ -272,6 +272,7 @@ igt_main
>   	}
>   
>   	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
> +		igt_describe("Test that selective update works when screen changes");
>   		igt_subtest_f("%s", op_str(data.op)) {
>   			prepare(&data);
>   			run(&data);


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
