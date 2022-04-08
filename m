Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F4910E256
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 16:47:44 +0000 (UTC)
Message-ID: <962b34e8-eb2c-a703-a3bf-f6a27ca8bc37@quicinc.com>
Date: Fri, 8 Apr 2022 09:47:42 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220406162906.6057-1-swati2.sharma@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220406162906.6057-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] Improvements in plane scaling
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



On 4/6/2022 9:29 AM, Swati Sharma wrote:
> Currently, plane scaling tests timesout in CI since they
> take large amount of time to loop through all pixel-formats per
> class for each modifier or rotation.
> So, to reduce execution time we are looping through either format
> or modifier or rotation keeping other two variants constant.
> 
> TODO: How to validate combination of format, modifier
> and rotation which executes in CI's time limits.
> 
> Swati Sharma (3):
>    tests/kms_plane_scaling: Fix modifier
>    tests/kms_plane_scaling: Fix modifier and format
>    tests/kms_plane_scaling: Tests to validate modifiers
> 
>   tests/kms_plane_scaling.c | 177 +++++++++++++++++++++-----------------
>   1 file changed, 98 insertions(+), 79 deletions(-)

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Lazor Chromebook 
(Trogdor)
> 
> -- 
> 2.25.1
> 
