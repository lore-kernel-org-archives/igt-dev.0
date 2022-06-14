Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CF589249
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 07:08:32 +0000 (UTC)
Message-ID: <03a4dce4-e4c7-a790-4475-89da70fe9a7d@linux.intel.com>
Date: Tue, 14 Jun 2022 08:08:29 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org, John.C.Harrison@Intel.com
References: <20220614004720.45666-1-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220614004720.45666-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/drm_fdinfo: Parse compute as
 well
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


On 14/06/2022 01:47, Nerlige Ramappa, Umesh wrote:
> Parse compute engines as well if available.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   lib/igt_drm_fdinfo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 250d9e89..5beb30b0 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -60,6 +60,7 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
>   		"copy",
>   		"video",
>   		"video-enhance",
> +		"compute",
>   	};
>   	ssize_t name_len;
>   	char *name, *p;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Although note that I have removed this driver specific data from this 
common library in the "driver agnostic gputop" series. So it would be 
good to review that one as well. ;)

Regards,

Tvrtko
