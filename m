Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <56b125e7-7fd6-4a9f-c37f-c99a5544d18b@linux.intel.com>
Date: Fri, 25 Mar 2022 08:21:29 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220324142621.347452-1-matthew.auld@intel.com>
 <20220324142621.347452-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220324142621.347452-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/gem_lmem_swapping: reduce the
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 3/24/22 15:26, Matthew Auld wrote:
> 300s is way too much for some BAT test. Drop it down to 45s.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   tests/i915/gem_lmem_swapping.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index ad1c989c..6c47bff2 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -219,7 +219,7 @@ static void __do_evict(int i915,
>   	 * For TEST_MULTI runs, make each object counts a loop to
>   	 * avoid excessive run times.
>   	 */
> -	for (l = 0; l < params->loops && igt_seconds_elapsed(&t) < 300; l += num) {
> +	for (l = 0; l < params->loops && igt_seconds_elapsed(&t) < 45; l += num) {
>   		unsigned int idx = rand() % params->count;
>   
>   		num = params->flags & TEST_MULTI ? rand() % max_swap_in + 1 : 1;

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

