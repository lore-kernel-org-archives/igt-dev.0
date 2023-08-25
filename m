Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5AC10E6AB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 14:29:25 +0000 (UTC)
Date: Fri, 25 Aug 2023 16:29:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230825142905.4bitytir4brym6y4@kamilkon-desk.igk.intel.com>
References: <20230824140519.1171540-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824140519.1171540-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe/xe_module_load: load
 snd_hda_intel module
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

Hi Swati,

On 2023-08-24 at 19:35:18 +0530, Swati Sharma wrote:
> snd_hda_intel kernel module is required to validate HD-audio.
> Load this module along with other modules.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_module_load.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
> index 575d57268..75ee948a7 100644
> --- a/tests/xe/xe_module_load.c
> +++ b/tests/xe/xe_module_load.c
> @@ -93,6 +93,7 @@ static void load_and_check_xe(const char *opts)
>  static const char * const unwanted_drivers[] = {
>  	"xe",
>  	"i915",
> +	"snd_hda_intel",
>  	NULL
>  };
>  
> -- 
> 2.25.1
> 
