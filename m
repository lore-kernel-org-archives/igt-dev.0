Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8277E10E4B9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 10:40:11 +0000 (UTC)
Message-ID: <08cbf1e8-89c7-c0cd-2928-589e624710b1@quicinc.com>
Date: Thu, 19 Oct 2023 03:40:04 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20211208192216.743364-1-robdclark@gmail.com>
 <20211208192216.743364-2-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211208192216.743364-2-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt 1/2] tools/msm_dp_compliance: Small arg
 parsing cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviving this:

On 12/8/2021 11:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Nit: shouldnt the patch prefix be "PATCH i-g-t" ?

We will test this out next week and land this.

> ---
>   tools/msm_dp_compliance.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> index 5e491c89..a15a8dd9 100644
> --- a/tools/msm_dp_compliance.c
> +++ b/tools/msm_dp_compliance.c
> @@ -629,7 +629,9 @@ static const char optstr[] = "hi";
>   static void __attribute__((noreturn)) usage(char *name, char opt)
>   {
>   	igt_info("usage: %s [-hi]\n", name);
> -	igt_info("\t-i\tdump info\n");
> +	igt_info("\t-h, --help           - print this usage message");
> +	igt_info("\t--help-description   - print test description");
> +	igt_info("\t-i, --info           - dump info\n");
>   	igt_info("\tDefault is to respond to Qd980 tests\n");
>   	exit((opt != 'h') ? -1 : 0);
>   }
> @@ -709,6 +711,7 @@ int main(int argc, char **argv)
>   	struct option long_opts[] = {
>   		{"help-description", 0, 0, HELP_DESCRIPTION},
>   		{"help", 0, 0, 'h'},
> +		{"info", 0, 0, 'i'},
>   	};
>   
>   	enter_exec_path(argv);
