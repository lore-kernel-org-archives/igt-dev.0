Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6F710E67D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 20:39:27 +0000 (UTC)
Message-ID: <3602fae0-75e6-3f40-b818-a6dc45567264@quicinc.com>
Date: Wed, 10 Jan 2024 12:39:23 -0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] tests/kms_bw: Add 2160x1440p mode
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20240105213603.109149-2-robdclark@gmail.com>
 <20240108215006.170234-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240108215006.170234-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 1/8/2024 1:50 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an additional mode so that we can get more kms_bw coverage on
> sc7180.
> 
> v2: Add missing comment listing subtest name
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   tests/kms_bw.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 

Matches the timings of sc7180,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
