Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6442C6FCC0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 13:49:32 +0000 (UTC)
References: <20200123134813.21466-1-petri.latvala@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <0e1e80fa-aee4-774d-0a3a-b9a434a01af2@linux.intel.com>
Date: Thu, 23 Jan 2020 13:49:28 +0000
MIME-Version: 1.0
In-Reply-To: <20200123134813.21466-1-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel_reg: Use static iterator
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 23/01/2020 13:48, Petri Latvala wrote:
> Convert open-coded for loops to __for_each_static_engine. That takes
> care of the last direct user of intel_execution_engines2.
> 
> More work is needed to make intel_reg support dynamically queried
> engines but this restores the old functionality.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tools/intel_reg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 847fdbed..5f1beba4 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -252,7 +252,7 @@ static const struct intel_execution_engine2 *find_engine(const char *name)
>   	if (name[0] == '-')
>   		name++;
>   
> -	for (e = intel_execution_engines2; e->name; e++) {
> +	__for_each_static_engine(e) {
>   		if (!strcasecmp(e->name, name))
>   			return e;
>   	}
> @@ -783,7 +783,7 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
>   	printf("\n\n");
>   
>   	printf("ENGINE is one of:\n");
> -	for (e = intel_execution_engines2; e->name; e++)
> +	__for_each_static_engine(e)
>   		printf("%s -%s ", e->name, e->name);
>   	printf("\n\n");
>   
> 

My bad for not grepping outside lib and tests with the previous patch. 
Thanks for jumping in!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
