Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360C10E3E2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 17:20:13 +0000 (UTC)
Date: Wed, 22 Mar 2023 18:20:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230322172006.otiu7cxhczsg7i4v@kamilkon-desk1>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
 <20230322000523.3310187-31-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322000523.3310187-31-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 30/31] tools/perf: Choose the right
 card
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Umesh,

On 2023-03-21 at 17:05:22 -0700, Umesh Nerlige Ramappa wrote:
> Choose the right dri card to open for perf recorder.

Is it one of patches which enables GPUvis ? I would like to
see this in commit message in one (or first) patch which
enables it (with description that following patches are also
needed). It would also help to write a little more why we
need this patch (as Ashutosh pointed).

> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  tools/i915-perf/i915_perf_recorder.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index ca435483..1c85a099 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -243,10 +243,10 @@ read_device_param(const char *stem, int id, const char *param)
>  }
>  
>  static int
> -find_intel_render_node(void)
> +find_intel_card_node(void)

What about naming this find_intel_dri_node(char *name) ?
Then below:

>  {
> -	for (int i = 128; i < (128 + 16); i++) {
> -		if (read_device_param("renderD", i, "vendor") == 0x8086)
> +	for (int i = 0; i < 128; i++) {
> +		if (read_device_param("card", i, "vendor") == 0x8086)
------------------------------------- ^
		if (read_device_param(name, i, "vendor") == 0x8086)

>  			return i;
>  	}
>  
> @@ -275,20 +275,18 @@ open_render_node(uint32_t *devid, int card)
---------------------------- ^
imho here you should also rename this function, for example:

	open_dri_node(uint32_t *devid, char *card_name, int card)

>  	char *name;
>  	int ret;
>  	int fd;
> -	int render;
>  
>  	if (card < 0) {
> -		render = find_intel_render_node();
> -		if (render < 0)
> +		card = find_intel_card_node();
> +
> +		if (card < 0)
>  			return -1;
> -	} else {
> -		render = 128 + card;
>  	}
>  
> -	ret = asprintf(&name, "/dev/dri/renderD%u", render);
> +	ret = asprintf(&name, "/dev/dri/card%u", card);

	ret = asprintf(&name, "/dev/dri/%s%u", card_name, card);

Then you also need to change it at callers or add helper(s).

Regards,
Kamil

>  	assert(ret != -1);
>  
> -	*devid = read_device_param("renderD", render, "device");
> +	*devid = read_device_param("card", card, "device");
>  
>  	fd = open(name, O_RDWR);
>  	free(name);
> -- 
> 2.36.1
> 
