Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF5710E0E5
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 07:29:23 +0000 (UTC)
Message-ID: <dba8b4fb-81c5-0e34-5173-50f84c5c5403@intel.com>
Date: Mon, 19 Jun 2023 12:59:04 +0530
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230619055814.32202-1-karthik.b.s@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230619055814.32202-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_joiner: Check if
 sequential pipe is enabled
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

Hi Karthik,

On Mon-19-06-2023 11:28 am, Karthik B S wrote:
> As big joiner is only possible on sequential pipe combinations,
> check that the required pipe is enabled before attempting
> a big joiner modeset.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_big_joiner.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
> index b9dda58f..47c1f5aa 100644
> --- a/tests/i915/kms_big_joiner.c
> +++ b/tests/i915/kms_big_joiner.c
> @@ -225,8 +225,11 @@ igt_main
>   	igt_subtest_with_dynamic("basic") {
>   		for (i = 0; i < data.n_pipes - 1; i++) {
>   			data.pipe1 = pipe_seq[i];
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> -				test_basic_modeset(&data);
> +			/* Check if the consecutive pipe is enabled*/
> +			if (pipe_seq[i + 1] == data.pipe1 + 1) {

Is there any way to use igt_check_bigjoiner_support() which is having 
all bigjoiner constraints?

- Bhanu

> +				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> +					test_basic_modeset(&data);
> +			}
>   		}
>   	}
>   
