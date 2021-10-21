Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E516EB7B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 07:18:57 +0000 (UTC)
Date: Thu, 21 Oct 2021 09:18:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211021071851.GB3640@zkempczy-mobl2>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
 <20211021043508.1158148-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021043508.1158148-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] i915/gem_engine_topology: Add
 compute class
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 10:05:05AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Add compute class to engine base names.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  lib/i915/gem_engine_topology.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index 4e497a5c..729f42b0 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -130,6 +130,7 @@ static const char *class_names[] = {
>  	[I915_ENGINE_CLASS_COPY]	  = "bcs",
>  	[I915_ENGINE_CLASS_VIDEO]	  = "vcs",
>  	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
> +	[I915_ENGINE_CLASS_COMPUTE]       = "ccs",
>  };
>  
>  static void init_engine(struct intel_execution_engine2 *e2,
> -- 
> 2.25.1
>

Ok, 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
