Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201113135618.1235497-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <28e4553d-1ae0-94a8-dc43-a0b4bb19d156@linux.intel.com>
Date: Mon, 16 Nov 2020 11:12:55 +0000
MIME-Version: 1.0
In-Reply-To: <20201113135618.1235497-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Show the active
 device
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


On 13/11/2020 13:56, Chris Wilson wrote:
> Include the active device name on the update screen.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tools/intel_gpu_top.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 298defa4e..c16e80502 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1027,7 +1027,8 @@ static bool print_groups(struct cnt_group **groups)
>   }
>   
>   static int
> -print_header(struct engines *engines, double t,
> +print_header(const struct igt_device_card *card,
> +	     struct engines *engines, double t,
>   	     int lines, int con_w, int con_h, bool *consumed)
>   {
>   	struct pmu_counter fake_pmu = {
> @@ -1106,14 +1107,15 @@ print_header(struct engines *engines, double t,
>   		printf("\033[H\033[J");
>   
>   		if (lines++ < con_h) {
> +			printf("intel-gpu-top: %s - ", card->card);
>   			if (!engines->discrete)
> -				printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> +				printf("%s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
>   					freq_items[1].buf, freq_items[0].buf,
>   					rc6_items[0].buf, power_items[0].buf,
>   					engines->rapl_unit,
>   					irq_items[0].buf);
>   			else
> -				printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s irqs/s\n",
> +				printf("%s/%s MHz;  %s%% RC6; %s irqs/s\n",
>   					freq_items[1].buf, freq_items[0].buf,
>   					rc6_items[0].buf, irq_items[0].buf);
>   		}
> @@ -1457,7 +1459,8 @@ int main(int argc, char **argv)
>   			break;
>   
>   		while (!consumed) {
> -			lines = print_header(engines, t, lines, con_w, con_h,
> +			lines = print_header(&card, engines,
> +					     t, lines, con_w, con_h,
>   					     &consumed);
>   
>   			if (engines->imc_fd)
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
