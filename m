Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC21E6E420
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2020 15:31:08 +0000 (UTC)
References: <20201124141924.108689-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <c2506cc1-4605-224b-5b5d-f2c4ee8d8fd6@linux.intel.com>
Date: Tue, 24 Nov 2020 15:30:53 +0000
MIME-Version: 1.0
In-Reply-To: <20201124141924.108689-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Include total
 package power
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 24/11/2020 14:19, Chris Wilson wrote:
> With integrated graphics the TDP is shared between the gpu and the cpu,
> knowing the total energy consumed by the package is relevant to
> understanding throttling.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tools/intel_gpu_top.c | 209 ++++++++++++++++++++++++++++--------------
>   1 file changed, 141 insertions(+), 68 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 86de09aa9..f3613eb72 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -71,6 +71,12 @@ struct engine {
>   	struct pmu_counter sema;
>   };
>   
> +struct rapl {
> +	uint64_t power, type;
> +	double scale;
> +	int fd;
> +};
> +
>   struct engines {
>   	unsigned int num_engines;
>   	unsigned int num_counters;
> @@ -78,9 +84,7 @@ struct engines {
>   	int fd;
>   	struct pmu_pair ts;
>   
> -	int rapl_fd;
> -	double rapl_scale;
> -	const char *rapl_unit;
> +	struct rapl r_gpu, r_pkg;
>   
>   	int imc_fd;
>   	double imc_reads_scale;
> @@ -92,7 +96,7 @@ struct engines {
>   	struct pmu_counter freq_act;
>   	struct pmu_counter irq;
>   	struct pmu_counter rc6;
> -	struct pmu_counter rapl;
> +	struct pmu_counter s_gpu, s_pkg;
>   	struct pmu_counter imc_reads;
>   	struct pmu_counter imc_writes;
>   
> @@ -108,6 +112,117 @@ struct engines {
>   
>   };
>   
> +__attribute__((format(scanf,3,4)))
> +static int igt_sysfs_scanf(int dir, const char *attr, const char *fmt, ...)
> +{
> +	FILE *file;
> +	int fd;
> +	int ret = -1;
> +
> +	fd = openat(dir, attr, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +
> +	file = fdopen(fd, "r");
> +	if (file) {
> +		va_list ap;
> +
> +		va_start(ap, fmt);
> +		ret = vfscanf(file, fmt, ap);
> +		va_end(ap);
> +
> +		fclose(file);
> +	} else {
> +		close(fd);
> +	}
> +
> +	return ret;
> +}
> +
> +static int rapl_parse(struct rapl *r, const char *str)
> +{
> +	locale_t locale, oldlocale;
> +	bool result = true;
> +	char buf[128];
> +	int dir;
> +
> +	memset(r, 0, sizeof(*r));

Not strictly needed as long as struct rapl are still embedded in engines.

> +
> +	dir = open("/sys/devices/power", O_RDONLY);
> +	if (dir < 0)
> +		return -errno;
> +
> +	/* Replace user environment with plain C to match kernel format */
> +	locale = newlocale(LC_ALL, "C", 0);
> +	oldlocale = uselocale(locale);
> +
> +	result &= igt_sysfs_scanf(dir, "type", "%"PRIu64, &r->type) == 1;
> +
> +	snprintf(buf, sizeof(buf), "events/energy-%s", str);
> +	result &= igt_sysfs_scanf(dir, buf, "event=%"PRIx64, &r->power) == 1;
> +
> +	snprintf(buf, sizeof(buf), "events/energy-%s.scale", str);
> +	result &= igt_sysfs_scanf(dir, buf, "%lf", &r->scale) == 1;
> +
> +	uselocale(oldlocale);
> +	freelocale(locale);
> +
> +	close(dir);
> +
> +	if (!result)
> +		return -EINVAL;
> +
> +	if (isnan(r->scale) || !r->scale)
> +		return -ERANGE;
> +
> +	return 0;
> +}
> +
> +static int rapl_open(struct rapl *r, const char *domain)
> +{
> +	r->fd = rapl_parse(r, domain);
> +	if (r->fd < 0)
> +		goto err;
> +
> +	r->fd = igt_perf_open(r->type, r->power);
> +	if (r->fd < 0) {
> +		r->fd = -errno;
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	errno = 0;
> +	return r->fd;
> +}
> +
> +static int gpu_power_open(struct rapl *r)
> +{
> +	return rapl_open(r, "gpu");
> +}
> +
> +static int pkg_power_open(struct rapl *r)
> +{
> +	return rapl_open(r, "pkg");
> +}
> +
> +static inline bool rapl_valid(struct rapl *r)
> +{
> +	return r->fd >= 0;
> +}

Unused.

> +
> +static inline int ram_power_open(struct rapl *r)
> +{
> +	return rapl_open(r, "ram");
> +}

Same.

> +
> +static inline void rapl_close(struct rapl *r)
> +{
> +	close(r->fd);
> +	r->fd = -1;
> +}
> +
>   static uint64_t
>   get_pmu_config(int dirfd, const char *name, const char *counter)
>   {
> @@ -357,38 +472,6 @@ static double filename_to_double(const char *filename)
>   	return v;
>   }
>   
> -#define RAPL_ROOT "/sys/devices/power/"
> -#define RAPL_EVENT "/sys/devices/power/events/"
> -
> -static uint64_t rapl_type_id(void)
> -{
> -	return filename_to_u64(RAPL_ROOT "type", 10);
> -}
> -
> -static uint64_t rapl_gpu_power(void)
> -{
> -	return filename_to_u64(RAPL_EVENT "energy-gpu", 0);
> -}
> -
> -static double rapl_gpu_power_scale(void)
> -{
> -	return filename_to_double(RAPL_EVENT "energy-gpu.scale");
> -}
> -
> -static const char *rapl_gpu_power_unit(void)
> -{
> -	char buf[32];
> -
> -	if (filename_to_buf(RAPL_EVENT "energy-gpu.unit",
> -			    buf, sizeof(buf)) == 0)
> -		if (!strcmp(buf, "Joules"))
> -			return strdup("Watts");
> -		else
> -			return strdup(buf);

We lose this handling of unexpected changes. Hard to decide if that is 
very important. Should be possible to keep by a simple addition to 
rapl_parse I think.

> -	else
> -		return NULL;
> -}
> -
>   #define IMC_ROOT "/sys/devices/uncore_imc/"
>   #define IMC_EVENT "/sys/devices/uncore_imc/events/"
>   
> @@ -516,23 +599,9 @@ static int pmu_init(struct engines *engines)
>   		}
>   	}
>   
> -	engines->rapl_fd = -1;
> -	if (!engines->discrete && rapl_type_id()) {
> -		engines->rapl_scale = rapl_gpu_power_scale();
> -		engines->rapl_unit = rapl_gpu_power_unit();
> -		if (!engines->rapl_unit)
> -			return -1;
> -
> -		engines->rapl.config = rapl_gpu_power();
> -		if (!engines->rapl.config)
> -			return -1;
> -
> -		engines->rapl_fd = igt_perf_open(rapl_type_id(),
> -						 engines->rapl.config);
> -		if (engines->rapl_fd < 0)
> -			return -1;
> -
> -		engines->rapl.present = true;
> +	if (!engines->discrete) {
> +		engines->s_gpu.present = gpu_power_open(&engines->r_gpu) >= 0;
> +		engines->s_pkg.present = pkg_power_open(&engines->r_pkg) >= 0;

Nit but possible return values seem to be only zero or negative.

>   	}
>   
>   	engines->imc_fd = -1;
> @@ -653,9 +722,13 @@ static void pmu_sample(struct engines *engines)
>   
>   	engines->ts.prev = engines->ts.cur;
>   
> -	if (engines->rapl_fd >= 0)
> -		__update_sample(&engines->rapl,
> -				pmu_read_single(engines->rapl_fd));
> +	if (engines->s_gpu.present)
> +		__update_sample(&engines->s_gpu,
> +				pmu_read_single(engines->r_gpu.fd));
> +
> +	if (engines->s_pkg.present)
> +		__update_sample(&engines->s_pkg,
> +				pmu_read_single(engines->r_pkg.fd));
>   
>   	if (engines->imc_fd >= 0) {
>   		pmu_read_multi(engines->imc_fd, 2, val);
> @@ -1076,8 +1149,8 @@ print_header(const struct igt_device_card *card,
>   		.items = rc6_items,
>   	};
>   	struct cnt_item power_items[] = {
> -		{ &engines->rapl, 4, 2, 1.0, t, engines->rapl_scale, "value",
> -		  "W" },
> +		{ &engines->s_gpu, 4, 2, 1.0, t, engines->r_gpu.scale, "gpu", "W" },
> +		{ &engines->s_pkg, 4, 2, 1.0, t, engines->r_pkg.scale, "pkg", "W" },
>   		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "W" },
>   		{ },
>   	};
> @@ -1108,17 +1181,17 @@ print_header(const struct igt_device_card *card,
>   
>   		if (lines++ < con_h) {
>   			printf("intel-gpu-top: %s - ", card->card);
> -			if (!engines->discrete)
> -				printf("%s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> -					freq_items[1].buf, freq_items[0].buf,
> -					rc6_items[0].buf, power_items[0].buf,
> -					engines->rapl_unit,
> -					irq_items[0].buf);
> -			else
> -				printf("%s/%s MHz;  %s%% RC6; %s irqs/s\n",
> -					freq_items[1].buf, freq_items[0].buf,
> -					rc6_items[0].buf, irq_items[0].buf);
> +			printf("%s/%s MHz;  %s%% RC6; ",
> +			       freq_items[1].buf, freq_items[0].buf,
> +			       rc6_items[0].buf);
> +			if (engines->s_gpu.present) {
> +				printf("%s/%s W; ",
> +				       power_items[0].buf,
> +				       power_items[1].buf);
> +			}
> +			printf("%s irqs/s\n", irq_items[0].buf);
>   		}
> +
>   		if (lines++ < con_h)
>   			printf("\n");
>   	}
> 

Can you be convinced to convert IMC as well to avoid having two 
implementations of opening and parsing perf sysfs?

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
