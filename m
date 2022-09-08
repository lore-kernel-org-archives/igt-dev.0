Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA32F10EA8E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 10:51:51 +0000 (UTC)
Message-ID: <25c5c25e-bbf7-5e34-db04-5e608a03e0a4@intel.com>
Date: Thu, 8 Sep 2022 16:21:27 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220907094323.6457-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220907094323.6457-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/testdisplay: Add test description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 9/7/2022 3:13 PM, Swati Sharma wrote:
> Added test description. Also, removed extra newlines.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/testdisplay.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index d45a722bf..ee272dfb2 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -69,6 +69,8 @@
>   #include <stdlib.h>
>   #include <signal.h>
>   
> +IGT_TEST_DESCRIPTION("Tests basic display functionality.");
> +
>   enum {
>   	OPT_YB,
>   	OPT_YF,
> @@ -427,7 +429,6 @@ set_stereo_mode(struct connector *c)
>   {
>   	int i, n;
>   
> -
>   	if (specified_mode_num != -1)
>   		n = 1;
>   	else
> @@ -515,7 +516,6 @@ int update_display(bool probe)
>   			if (test_preferred_mode || force_mode ||
>   			    specified_mode_num != -1)
>   				crtc_idx_mask &= ~(1 << connector->pipe);
> -
>   		}
>   	}
>   

