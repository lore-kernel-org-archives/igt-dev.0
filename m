Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8557910E3DE
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 04:46:25 +0000 (UTC)
Message-ID: <e12d35bc-815e-d77a-27e3-2c56fbf95229@intel.com>
Date: Thu, 22 Jun 2023 10:15:57 +0530
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
References: <20230619085800.1994271-1-bhanuprakash.modem@intel.com>
 <20230619085800.1994271-3-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230619085800.1994271-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/2] tests/kms_cursor_legacy: Allow busy tests
 to run on XE
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


On Mon-19-06-2023 02:28 pm, Bhanuprakash Modem wrote:
> As busy tests supports both i915 & XE, update the intel specific
> checks to allow them to run on XE.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

> ---
>   tests/kms_cursor_legacy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1f0f3b7e6..d55d96067 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1752,7 +1752,7 @@ igt_main
>   	igt_describe("this test perform a busy bo update followed by a cursor update");
>   	igt_subtest_group {
>   		igt_fixture {
> -			igt_require_i915(display.drm_fd);
> +			igt_require_intel(display.drm_fd);
>   			igt_require_pipe_crc(display.drm_fd);
>   			igt_display_require_output(&display);
>   		}
