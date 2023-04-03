Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3259210E342
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:13:04 +0000 (UTC)
Message-ID: <0b74dc55-fdea-d140-075c-457710a48d11@linux.intel.com>
Date: Mon, 3 Apr 2023 11:12:59 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230331195915.5839-1-umesh.nerlige.ramappa@intel.com>
 <20230331195915.5839-2-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230331195915.5839-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/drm_fdinfo: Check for compute
 engines when parsing
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


On 31/03/2023 20:59, Umesh Nerlige Ramappa wrote:
> DG2 has compute engine support. When parsing the fdinfo for available engines,
> also check for compute. This fixes drm_fdinfo@basic for platforms where compute
> is present.
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

Regards,

Tvrtko
