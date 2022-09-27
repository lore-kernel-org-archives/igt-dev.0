Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888D310E949
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 14:00:38 +0000 (UTC)
Message-ID: <211cc101-b15e-5770-dd7f-f57761bf351c@intel.com>
Date: Tue, 27 Sep 2022 19:30:33 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-6-kunal1.joshi@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220926185321.2897136-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 5/5] tests/kms_hdmi_inject: test
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

Please improve your commit message.
We don't write commit message as points.

On 27-Sep-22 12:23 AM, Kunal Joshi wrote:
> -> Free resources
> -> close drm_fd
> 
> Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_hdmi_inject.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index abae0ab4..0bb51165 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -219,5 +219,7 @@ igt_main
>   
>   	igt_fixture {
>   		drmModeFreeConnector(connector);
> +		drmModeFreeResources(res);
> +		close(drm_fd);
>   	}
>   }

-- 
~Swati Sharma
