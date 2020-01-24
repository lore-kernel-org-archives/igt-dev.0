Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200124170337.346187-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ab195c79-77f6-c128-340a-e80f10a886e5@intel.com>
Date: Fri, 24 Jan 2020 19:11:03 +0200
MIME-Version: 1.0
In-Reply-To: <20200124170337.346187-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] perf: Treat Cometlake as an alias for
 Coffeelake
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Thanks.
Hopefully I'll a series soon getting rid of all this special case stuff.

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


On 24/01/2020 19:03, Chris Wilson wrote:
> The kernel doesn't differentiate between the Coffeelake and Cometlake
> platforms, but igt does. Add the alias for perf to use the Coffeelake
> register set for Cometlake.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/perf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/perf.c b/tests/perf.c
> index a837551cb..f1f9b7cea 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -955,7 +955,7 @@ init_sys_info(void)
>   			}
>   		} else if (IS_GEMINILAKE(devid)) {
>   			test_set_uuid = "dd3fd789-e783-4204-8cd0-b671bbccb0cf";
> -		} else if (IS_COFFEELAKE(devid)) {
> +		} else if (IS_COFFEELAKE(devid) || IS_COMETLAKE(devid)) {
>   			switch (intel_gt(devid)) {
>   			case 1:
>   				test_set_uuid = "74fb4902-d3d3-4237-9e90-cbdc68d0a446";


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
