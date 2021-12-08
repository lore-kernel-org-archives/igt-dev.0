Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A216E896
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 19:50:22 +0000 (UTC)
Message-ID: <57372311-1063-d1fb-d642-43fcec9364e8@quicinc.com>
Date: Wed, 8 Dec 2021 11:50:17 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <20211208192216.743364-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211208192216.743364-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt 0/2] tools/msm_dp_compliance:
 Multi-connector support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <igt-dev@lists.freedesktop.org>

I have not validated compliance with this but it should work.

For the series,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

On 12/8/2021 11:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Update the compliance tool with an optional arg to specify the connector
> name.  This will be required for newer kernels, which will move the
> needed debugfs files into a per-connector subdirectory.
> 
> Rob Clark (2):
>    tools/msm_dp_compliance: Small arg parsing cleanup
>    tools/msm_dp_compliance: Add arg to specify connector name
> 
>   tools/msm_dp_compliance.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
