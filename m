Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D176E3A4
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2020 08:29:30 +0000 (UTC)
References: <20200806110803.19062-1-swati2.sharma@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <54def510-753d-a1dc-f6be-a00a8553a3e0@intel.com>
Date: Mon, 10 Aug 2020 13:59:28 +0530
MIME-Version: 1.0
In-Reply-To: <20200806110803.19062-1-swati2.sharma@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Add testdisplay test to BAT
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

BAT results
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html?testfilter=testdisplay

Execution time of few CI m/c.
|fi-tgl-dsi|fi-tgl-u2|fi-tgl-y|fi-ehl-1|fi-icl-u2|fi-icl-y|fi-cml-u2|
|  0.352s  |  0.064s | 0.548s |	4.686s |  5.311s | 0.101s | 1.464s  |

Execution time depends upon which panel is connected if its edp max it 
supports 2 resolutions => less time. For HDMI; having multiple 
resolutions its taking more time.

On 06-Aug-20 4:38 PM, Swati Sharma wrote:
> testdisplay should be added to BAT. testdisplay is considered
> to be the most basic test to test display functionality.
> With this test we will be able to test modesetting.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index b796b264..b245b7a7 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -149,6 +149,7 @@ igt@vgem_basic@dmabuf-mmap
>   igt@vgem_basic@mmap
>   igt@vgem_basic@second-client
>   igt@vgem_basic@sysfs
> +igt@testdisplay
>   
>   # All tests that do module unloading and reloading are executed last.
>   # They will sometimes reveal issues of earlier tests leaving the
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
