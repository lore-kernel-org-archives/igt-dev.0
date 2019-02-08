Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190208120351.18505-1-tvrtko.ursulin@linux.intel.com>
From: Eero Tamminen <eero.t.tamminen@intel.com>
Message-ID: <3e8a686d-2336-9317-e2fa-bd695ac18d8d@intel.com>
Date: Fri, 8 Feb 2019 15:58:49 +0200
MIME-Version: 1.0
In-Reply-To: <20190208120351.18505-1-tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/mixed; boundary="------------F18D3BC78B07663BB587A21E"
Content-Language: en-US
Subject: Re: [igt-dev] [IGT 1/2] tools/intel_gpu_top: Add support for stdout
 logging
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, 3.14pi@ukr.net, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------F18D3BC78B07663BB587A21E
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

On 8.2.2019 14.03, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Two new output modes are added: listing of text data to standard out (-l
> on the command line), and dumping of JSON formatted records (-J), also to
> standard out.
> 
> The first mode is selected automatically when non-interactive standard out
> is detected.
> 
> Example of text output:
> 
>   Freq MHz      IRQ RC6 Power     IMC MiB/s           RCS/0           BCS/0           VCS/0           VCS/1          VECS/0
>   req  act       /s   %     W     rd     wr       %  se  wa       %  se  wa       %  se  wa       %  se  wa       %  se  wa
>     0    0        0   0  0.00    360      0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
>   350  350        0 100  0.00     35      2    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
>   350  350        0 100  0.00     34      2    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
>   350  350        0 100  0.00    143      6    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
>   350  350        0 100  0.00    169      7    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0
>   350  350        0 100  0.00    169      7    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0    0.00   0   0

Looks nice!

If you add '#' to the start of the header lines, one could use something 
like the attached shell script to convert the saved output to SVG graphs 
with GnuPlot.

Before including the script to igt, it would need to be modified to 
adapt to the number of engines, but maybe intel_gpu_top itself could 
generate the gnuplot control file when it exits, if given e.g. --gnuplot 
argument?


	- Eero

> Example of JSON output:
> 
> {
>          "period": {
>                  "duration": 1002.525224,
>                  "unit": "ms"
>          },
>          "frequency": {
>                  "requested": 349.118398,
>                  "actual": 349.118398,
>                  "unit": "MHz"
>          },
>          "interrupts": {
>                  "count": 0.000000,
>                  "unit": "irq/s"
>          },
>          "rc6": {
>                  "value": 99.897752,
>                  "unit": "%"
>          },
>          "power": {
>                  "value": 0.000000,
>                  "unit": "W"
>          },
>          "imc-bandwidth": {
>                  "reads": 149.683843,
>                  "writes": 6.104093,
>                  "unit": "MiB/s"
>          },
>          "engines": {
>                  "Render/3D/0": {
>                          "busy": 0.000000,
>                          "sema": 0.000000,
>                          "wait": 0.000000,
>                          "unit": "%"
>                  },
>                  "Blitter/0": {
>                          "busy": 0.000000,
>                          "sema": 0.000000,
>                          "wait": 0.000000,
>                          "unit": "%"
>                  },
>                  "Video/0": {
>                          "busy": 0.000000,
>                          "sema": 0.000000,
>                          "wait": 0.000000,
>                          "unit": "%"
>                  },
>                  "Video/1": {
>                          "busy": 0.000000,
>                          "sema": 0.000000,
>                          "wait": 0.000000,
>                          "unit": "%"
>                  },
>                  "VideoEnhance/0": {
>                          "busy": 0.000000,
>                          "sema": 0.000000,
>                          "wait": 0.000000,
>                          "unit": "%"
>                  }
>          }
> }
> 
> v2:
>   * Show example output in commit message.
>   * Install signal handler to complete output on SIGINT. (Chris Wilson)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> References: https://bugs.freedesktop.org/show_bug.cgi?id=108689
> Cc: Eero Tamminen <eero.t.tamminen@intel.com>
> Cc: 3.14pi@ukr.net
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   man/intel_gpu_top.rst |   9 +-
>   tools/intel_gpu_top.c | 761 +++++++++++++++++++++++++++++++++++-------
>   2 files changed, 650 insertions(+), 120 deletions(-)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index 19c712307d28..d5bda093c8e8 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -7,9 +7,9 @@ Display a top-like summary of Intel GPU usage
>   ---------------------------------------------
>   .. include:: defs.rst
>   :Author: IGT Developers <igt-dev@lists.freedesktop.org>
> -:Date: 2018-04-04
> +:Date: 2019-02-08
>   :Version: |PACKAGE_STRING|
> -:Copyright: 2009,2011,2012,2016,2018 Intel Corporation
> +:Copyright: 2009,2011,2012,2016,2018,2019 Intel Corporation
>   :Manual section: |MANUAL_SECTION|
>   :Manual group: |MANUAL_GROUP|
>   
> @@ -31,6 +31,11 @@ OPTIONS
>   -s <ms>
>       Refresh period in milliseconds.
>   
> +-l
> +    List text data to standard out.
> +
> +-J
> +    Output JSON formatted data to standard output.
>   -h
>       Show help text.
>   
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index b923c3cfbe97..807d518aaf87 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright © 2007-2018 Intel Corporation
> + * Copyright © 2007-2019 Intel Corporation
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
>    * copy of this software and associated documentation files (the "Software"),
> @@ -19,10 +19,6 @@
>    * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>    * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>    * DEALINGS IN THE SOFTWARE.
> - *
> - * Authors:
> - *    Eric Anholt <eric@anholt.net>
> - *    Eugeni Dodonov <eugeni.dodonov@intel.com>
>    */
>   
>   #include <stdio.h>
> @@ -41,6 +37,8 @@
>   #include <errno.h>
>   #include <math.h>
>   #include <locale.h>
> +#include <limits.h>
> +#include <signal.h>
>   
>   #include "igt_perf.h"
>   
> @@ -59,6 +57,7 @@ struct pmu_counter {
>   struct engine {
>   	const char *name;
>   	const char *display_name;
> +	const char *short_name;
>   
>   	unsigned int class;
>   	unsigned int instance;
> @@ -142,6 +141,22 @@ static const char *class_display_name(unsigned int class)
>   	}
>   }
>   
> +static const char *class_short_name(unsigned int class)
> +{
> +	switch (class) {
> +	case I915_ENGINE_CLASS_RENDER:
> +		return "RCS";
> +	case I915_ENGINE_CLASS_COPY:
> +		return "BCS";
> +	case I915_ENGINE_CLASS_VIDEO:
> +		return "VCS";
> +	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VECS";
> +	default:
> +		return "UNKN";
> +	}
> +}
> +
>   static int engine_cmp(const void *__a, const void *__b)
>   {
>   	const struct engine *a = (struct engine *)__a;
> @@ -227,7 +242,6 @@ static struct engines *discover_engines(void)
>   			ret = ENOBUFS;
>   			break;
>   		}
> -		ret = 0;
>   
>   		engine->display_name = strdup(buf);
>   		if (!engine->display_name) {
> @@ -235,6 +249,20 @@ static struct engines *discover_engines(void)
>   			break;
>   		}
>   
> +		ret = snprintf(buf, sizeof(buf), "%s/%u",
> +			       class_short_name(engine->class),
> +			       engine->instance);
> +		if (ret < 0 || ret == sizeof(buf)) {
> +			ret = ENOBUFS;
> +			break;
> +		}
> +
> +		engine->short_name = strdup(buf);
> +		if (!engine->short_name) {
> +			ret = errno;
> +			break;
> +		}
> +
>   		engines->num_engines++;
>   		engines = realloc(engines, sizeof(struct engines) +
>   				  engines->num_engines * sizeof(struct engine));
> @@ -242,6 +270,8 @@ static struct engines *discover_engines(void)
>   			ret = errno;
>   			break;
>   		}
> +
> +		ret = 0;
>   	}
>   
>   	if (ret) {
> @@ -551,7 +581,7 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>   	return buf[1];
>   }
>   
> -static double __pmu_calc(struct pmu_pair *p, double d, double t, double s)
> +static double pmu_calc(struct pmu_pair *p, double d, double t, double s)
>   {
>   	double v;
>   
> @@ -576,30 +606,6 @@ static void fill_str(char *buf, unsigned int bufsz, char c, unsigned int num)
>   	*buf = 0;
>   }
>   
> -static void pmu_calc(struct pmu_counter *cnt,
> -		     char *buf, unsigned int bufsz,
> -		     unsigned int width, unsigned width_dec,
> -		     double d, double t, double s)
> -{
> -	double val;
> -	int len;
> -
> -	assert(bufsz >= (width + width_dec + 1));
> -
> -	if (!cnt->present) {
> -		fill_str(buf, bufsz, '-', width + width_dec);
> -		return;
> -	}
> -
> -	val = __pmu_calc(&cnt->val, d, t, s);
> -
> -	len = snprintf(buf, bufsz, "%*.*f", width + width_dec, width_dec, val);
> -	if (len < 0 || len == bufsz) {
> -		fill_str(buf, bufsz, 'X', width + width_dec);
> -		return;
> -	}
> -}
> -
>   static uint64_t __pmu_read_single(int fd, uint64_t *ts)
>   {
>   	uint64_t data[2] = { };
> @@ -697,11 +703,559 @@ usage(const char *appname)
>   		"\n"
>   		"\tThe following parameters are optional:\n\n"
>   		"\t[-s <ms>]       Refresh period in milliseconds (default %ums).\n"
> +		"\t[-l]            List data to standard out.\n"
> +		"\t[-J]            JSON data to standard out.\n"
>   		"\t[-h]            Show this help text.\n"
>   		"\n",
>   		appname, DEFAULT_PERIOD_MS);
>   }
>   
> +static enum {
> +	INTERACTIVE,
> +	STDOUT,
> +	JSON
> +} output_mode;
> +
> +struct cnt_item {
> +	struct pmu_counter *pmu;
> +	unsigned int fmt_d;
> +	unsigned int fmt_dd;
> +	double d;
> +	double t;
> +	double s;
> +	const char *name;
> +	const char *unit;
> +
> +	/* Internal fields. */
> +	char buf[16];
> +};
> +
> +struct cnt_group {
> +	const char *name;
> +	const char *display_name;
> +	struct cnt_item *items;
> +};
> +
> +static unsigned int json_indent_level;
> +
> +static const char *json_indent[] = {
> +	"",
> +	"\t",
> +	"\t\t",
> +	"\t\t\t",
> +	"\t\t\t\t",
> +	"\t\t\t\t\t",
> +};
> +
> +#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
> +
> +static unsigned int json_prev_struct_members;
> +static unsigned int json_struct_members;
> +
> +static void
> +json_open_struct(const char *name)
> +{
> +	assert(json_indent_level < ARRAY_SIZE(json_indent));
> +
> +	json_prev_struct_members = json_struct_members;
> +	json_struct_members = 0;
> +
> +	if (name)
> +		printf("%s%s\"%s\": {\n",
> +		       json_prev_struct_members ? ",\n" : "",
> +		       json_indent[json_indent_level],
> +		       name);
> +	else
> +		printf("%s\n%s{\n",
> +		       json_prev_struct_members ? "," : "",
> +		       json_indent[json_indent_level]);
> +
> +	json_indent_level++;
> +}
> +
> +static void
> +json_close_struct(void)
> +{
> +	assert(json_indent_level > 0);
> +
> +	printf("\n%s}", json_indent[--json_indent_level]);
> +
> +	if (json_indent_level == 0)
> +		fflush(stdout);
> +}
> +
> +static unsigned int
> +json_add_member(const struct cnt_group *parent, struct cnt_item *item,
> +		unsigned int headers)
> +{
> +	assert(json_indent_level < ARRAY_SIZE(json_indent));
> +
> +	printf("%s%s\"%s\": ",
> +		json_struct_members ? ",\n" : "",
> +		json_indent[json_indent_level], item->name);
> +
> +	json_struct_members++;
> +
> +	if (!strcmp(item->name, "unit"))
> +		printf("\"%s\"", item->unit);
> +	else
> +		printf("%f",
> +		       pmu_calc(&item->pmu->val, item->d, item->t, item->s));
> +
> +	return 1;
> +}
> +
> +static unsigned int stdout_level;
> +
> +#define STDOUT_HEADER_REPEAT 20
> +static unsigned int stdout_lines = STDOUT_HEADER_REPEAT;
> +
> +static void
> +stdout_open_struct(const char *name)
> +{
> +	stdout_level++;
> +	assert(stdout_level > 0);
> +}
> +
> +static void
> +stdout_close_struct(void)
> +{
> +	assert(stdout_level > 0);
> +	if (--stdout_level == 0) {
> +		stdout_lines++;
> +		printf("\n");
> +		fflush(stdout);
> +	}
> +}
> +
> +static unsigned int
> +stdout_add_member(const struct cnt_group *parent, struct cnt_item *item,
> +		  unsigned int headers)
> +{
> +	unsigned int fmt_tot = item->fmt_d + (item->fmt_dd ? 1 : 0);
> +	char buf[fmt_tot + 1];
> +	double val;
> +	int len;
> +
> +	if (!item->pmu)
> +		return 0;
> +	else if (!item->pmu->present)
> +		return 0;
> +
> +	if (headers == 1) {
> +		unsigned int grp_tot = 0;
> +		struct cnt_item *it;
> +
> +		if (item != parent->items)
> +			return 0;
> +
> +		for (it = parent->items; it->pmu; it++) {
> +			if (!it->pmu->present)
> +				continue;
> +
> +			grp_tot += 1 + it->fmt_d + (it->fmt_dd ? 1 : 0);
> +		}
> +
> +		printf("%*s ", grp_tot - 1, parent->display_name);
> +		return 0;
> +	} else if (headers == 2) {
> +		printf("%*s ", fmt_tot, item->unit ?: item->name);
> +		return 0;
> +	}
> +
> +	val = pmu_calc(&item->pmu->val, item->d, item->t, item->s);
> +
> +	len = snprintf(buf, sizeof(buf), "%*.*f", fmt_tot, item->fmt_dd, val);
> +	if (len < 0 || len == sizeof(buf))
> +		fill_str(buf, sizeof(buf), 'X', fmt_tot);
> +
> +	len = printf("%s ", buf);
> +
> +	return len > 0 ? len : 0;
> +}
> +
> +static void
> +term_open_struct(const char *name)
> +{
> +}
> +
> +static void
> +term_close_struct(void)
> +{
> +}
> +
> +static unsigned int
> +term_add_member(const struct cnt_group *parent, struct cnt_item *item,
> +		unsigned int headers)
> +{
> +	unsigned int fmt_tot = item->fmt_d + (item->fmt_dd ? 1 : 0);
> +	double val;
> +	int len;
> +
> +	if (!item->pmu)
> +		return 0;
> +
> +	assert(fmt_tot <= sizeof(item->buf));
> +
> +	if (!item->pmu->present) {
> +		fill_str(item->buf, sizeof(item->buf), '-', fmt_tot);
> +		return 1;
> +	}
> +
> +	val = pmu_calc(&item->pmu->val, item->d, item->t, item->s);
> +	len = snprintf(item->buf, sizeof(item->buf),
> +		       "%*.*f",
> +		       fmt_tot, item->fmt_dd, val);
> +
> +	if (len < 0 || len == sizeof(item->buf))
> +		fill_str(item->buf, sizeof(item->buf), 'X', fmt_tot);
> +
> +	return 1;
> +}
> +
> +struct print_operations {
> +	void (*open_struct)(const char *name);
> +	void (*close_struct)(void);
> +	unsigned int (*add_member)(const struct cnt_group *parent,
> +				   struct cnt_item *item,
> +				   unsigned int headers);
> +	bool (*print_group)(struct cnt_group *group, unsigned int headers);
> +};
> +
> +static const struct print_operations *pops;
> +
> +static unsigned int
> +present_in_group(const struct cnt_group *grp)
> +{
> +	unsigned int present = 0;
> +	struct cnt_item *item;
> +
> +	for (item = grp->items; item->name; item++) {
> +		if (item->pmu && item->pmu->present)
> +			present++;
> +	}
> +
> +	return present;
> +}
> +
> +static bool
> +print_group(struct cnt_group *grp, unsigned int headers)
> +{
> +	unsigned int consumed = 0;
> +	struct cnt_item *item;
> +
> +	if (!present_in_group(grp))
> +		return false;
> +
> +	pops->open_struct(grp->name);
> +
> +	for (item = grp->items; item->name; item++)
> +		consumed += pops->add_member(grp, item, headers);
> +
> +	pops->close_struct();
> +
> +	return consumed;
> +}
> +
> +static bool
> +term_print_group(struct cnt_group *grp, unsigned int headers)
> +{
> +	unsigned int consumed = 0;
> +	struct cnt_item *item;
> +
> +	pops->open_struct(grp->name);
> +
> +	for (item = grp->items; item->name; item++)
> +		consumed += pops->add_member(grp, item, headers);
> +
> +	pops->close_struct();
> +
> +	return consumed;
> +}
> +
> +static const struct print_operations json_pops = {
> +	.open_struct = json_open_struct,
> +	.close_struct = json_close_struct,
> +	.add_member = json_add_member,
> +	.print_group = print_group,
> +};
> +
> +static const struct print_operations stdout_pops = {
> +	.open_struct = stdout_open_struct,
> +	.close_struct = stdout_close_struct,
> +	.add_member = stdout_add_member,
> +	.print_group = print_group,
> +};
> +
> +static const struct print_operations term_pops = {
> +	.open_struct = term_open_struct,
> +	.close_struct = term_close_struct,
> +	.add_member = term_add_member,
> +	.print_group = term_print_group,
> +};
> +
> +static bool print_groups(struct cnt_group **groups)
> +{
> +	unsigned int headers = stdout_lines % STDOUT_HEADER_REPEAT + 1;
> +	bool print_data = true;
> +
> +	if (output_mode == STDOUT && (headers == 1 || headers == 2)) {
> +		for (struct cnt_group **grp = groups; *grp; grp++)
> +			print_data = pops->print_group(*grp, headers);
> +	}
> +
> +	for (struct cnt_group **grp = groups; print_data && *grp; grp++)
> +		pops->print_group(*grp, false);
> +
> +	return print_data;
> +}
> +
> +static int
> +print_header(struct engines *engines, double t,
> +	     int lines, int con_w, int con_h, bool *consumed)
> +{
> +	struct pmu_counter fake_pmu = {
> +		.present = true,
> +		.val.cur = 1,
> +	};
> +	struct cnt_item period_items[] = {
> +		{ &fake_pmu, 0, 0, 1.0, 1.0, t * 1e3, "duration" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "ms" },
> +		{ },
> +	};
> +	struct cnt_group period_group = {
> +		.name = "period",
> +		.items = period_items,
> +	};
> +	struct cnt_item freq_items[] = {
> +		{ &engines->freq_req, 4, 0, 1.0, t, 1, "requested", "req" },
> +		{ &engines->freq_act, 4, 0, 1.0, t, 1, "actual", "act" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "MHz" },
> +		{ },
> +	};
> +	struct cnt_group freq_group = {
> +		.name = "frequency",
> +		.display_name = "Freq MHz",
> +		.items = freq_items,
> +	};
> +	struct cnt_item irq_items[] = {
> +		{ &engines->irq, 8, 0, 1.0, t, 1, "count", "/s" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "irq/s" },
> +		{ },
> +	};
> +	struct cnt_group irq_group = {
> +		.name = "interrupts",
> +		.display_name = "IRQ",
> +		.items = irq_items,
> +	};
> +	struct cnt_item rc6_items[] = {
> +		{ &engines->rc6, 3, 0, 1e9, t, 100, "value", "%" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
> +		{ },
> +	};
> +	struct cnt_group rc6_group = {
> +		.name = "rc6",
> +		.display_name = "RC6",
> +		.items = rc6_items,
> +	};
> +	struct cnt_item power_items[] = {
> +		{ &engines->rapl, 4, 2, 1.0, t, engines->rapl_scale, "value",
> +		  "W" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "W" },
> +		{ },
> +	};
> +	struct cnt_group power_group = {
> +		.name = "power",
> +		.display_name = "Power",
> +		.items = power_items,
> +	};
> +	struct cnt_group *groups[] = {
> +		&period_group,
> +		&freq_group,
> +		&irq_group,
> +		&rc6_group,
> +		&power_group,
> +		NULL
> +	};
> +
> +	if (output_mode != JSON)
> +		memmove(&groups[0], &groups[1],
> +			sizeof(groups) - sizeof(groups[0]));
> +
> +	pops->open_struct(NULL);
> +
> +	*consumed = print_groups(groups);
> +
> +	if (output_mode == INTERACTIVE) {
> +		printf("\033[H\033[J");
> +
> +		if (lines++ < con_h)
> +			printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> +			       freq_items[1].buf, freq_items[0].buf,
> +			       rc6_items[0].buf, power_items[0].buf,
> +			       engines->rapl_unit,
> +			       irq_items[0].buf);
> +
> +		if (lines++ < con_h)
> +			printf("\n");
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_imc(struct engines *engines, double t, int lines, int con_w, int con_h)
> +{
> +	struct cnt_item imc_items[] = {
> +		{ &engines->imc_reads, 6, 0, 1.0, t, engines->imc_reads_scale,
> +		  "reads", "rd" },
> +		{ &engines->imc_writes, 6, 0, 1.0, t, engines->imc_writes_scale,
> +		  "writes", "wr" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit" },
> +		{ },
> +	};
> +	struct cnt_group imc_group = {
> +		.name = "imc-bandwidth",
> +		.items = imc_items,
> +	};
> +	struct cnt_group *groups[] = {
> +		&imc_group,
> +		NULL
> +	};
> +	int ret;
> +
> +	ret = asprintf((char **)&imc_group.display_name, "IMC %s/s",
> +			engines->imc_reads_unit);
> +	assert(ret >= 0);
> +
> +	ret = asprintf((char **)&imc_items[2].unit, "%s/s",
> +			engines->imc_reads_unit);
> +	assert(ret >= 0);
> +
> +	print_groups(groups);
> +
> +	free((void *)imc_group.display_name);
> +	free((void *)imc_items[2].unit);
> +
> +	if (output_mode == INTERACTIVE) {
> +		if (lines++ < con_h)
> +			printf("      IMC reads:   %s %s/s\n",
> +			       imc_items[0].buf, engines->imc_reads_unit);
> +
> +		if (lines++ < con_h)
> +			printf("     IMC writes:   %s %s/s\n",
> +			       imc_items[1].buf, engines->imc_writes_unit);
> +
> +		if (lines++ < con_h)
> +			printf("\n");
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct engines *engines, double t,
> +		     int lines, int con_w, int con_h)
> +{
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		pops->open_struct("engines");
> +
> +		if (output_mode == INTERACTIVE) {
> +			const char *a = "          ENGINE      BUSY ";
> +			const char *b = " MI_SEMA MI_WAIT";
> +
> +			printf("\033[7m%s%*s%s\033[0m\n",
> +			       a, (int)(con_w - 1 - strlen(a) - strlen(b)),
> +			       " ", b);
> +
> +			lines++;
> +		}
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct engines *engines, unsigned int i, double t,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct engine *engine = engine_ptr(engines, i);
> +	struct cnt_item engine_items[] = {
> +		{ &engine->busy, 6, 2, 1e9, t, 100, "busy", "%" },
> +		{ &engine->sema, 3, 0, 1e9, t, 100, "sema", "se" },
> +		{ &engine->wait, 3, 0, 1e9, t, 100, "wait", "wa" },
> +		{ NULL, 0, 0, 0.0, 0.0, 0.0, "unit", "%" },
> +		{ },
> +	};
> +	struct cnt_group engine_group = {
> +		.name = engine->display_name,
> +		.display_name = engine->short_name,
> +		.items = engine_items,
> +	};
> +	struct cnt_group *groups[] = {
> +		&engine_group,
> +		NULL
> +	};
> +
> +	if (!engine->num_counters)
> +		return lines;
> +
> +	print_groups(groups);
> +
> +	if (output_mode == INTERACTIVE) {
> +		unsigned int max_w = con_w - 1;
> +		unsigned int len;
> +		char buf[128];
> +		double val;
> +
> +		len = snprintf(buf, sizeof(buf), "    %s%%    %s%%",
> +			       engine_items[1].buf, engine_items[2].buf);
> +
> +		len += printf("%16s %s%% ",
> +			      engine->display_name, engine_items[0].buf);
> +
> +		val = pmu_calc(&engine->busy.val, 1e9, t, 100);
> +		print_percentage_bar(val, max_w - len);
> +
> +		printf("%s\n", buf);
> +
> +		lines++;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engines_footer(struct engines *engines, double t,
> +		     int lines, int con_w, int con_h)
> +{
> +	pops->close_struct();
> +	pops->close_struct();
> +
> +	if (output_mode == INTERACTIVE) {
> +		if (lines++ < con_h)
> +			printf("\n");
> +	}
> +
> +	return lines;
> +}
> +
> +static bool stop_top;
> +
> +static void sigint_handler(int  sig)
> +{
> +	stop_top = true;
> +}
> +
>   int main(int argc, char **argv)
>   {
>   	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
> @@ -711,11 +1265,17 @@ int main(int argc, char **argv)
>   	int ret, ch;
>   
>   	/* Parse options */
> -	while ((ch = getopt(argc, argv, "s:h")) != -1) {
> +	while ((ch = getopt(argc, argv, "s:Jlh")) != -1) {
>   		switch (ch) {
>   		case 's':
>   			period_us = atoi(optarg) * 1000;
>   			break;
> +		case 'J':
> +			output_mode = JSON;
> +			break;
> +		case 'l':
> +			output_mode = STDOUT;
> +			break;
>   		case 'h':
>   			usage(argv[0]);
>   			exit(0);
> @@ -726,6 +1286,31 @@ int main(int argc, char **argv)
>   		}
>   	}
>   
> +	if (output_mode == INTERACTIVE && isatty(1) != 1)
> +		output_mode = STDOUT;
> +
> +	if (output_mode != INTERACTIVE) {
> +		sighandler_t sig = signal(SIGINT, sigint_handler);
> +
> +		if (sig == SIG_ERR)
> +			fprintf(stderr, "Failed to install signal handler!\n");
> +	}
> +
> +	switch (output_mode) {
> +	case INTERACTIVE:
> +		pops = &term_pops;
> +		break;
> +	case STDOUT:
> +		pops = &stdout_pops;
> +		break;
> +	case JSON:
> +		pops = &json_pops;
> +		break;
> +	default:
> +		assert(0);
> +		break;
> +	};
> +
>   	engines = discover_engines();
>   	if (!engines) {
>   		fprintf(stderr,
> @@ -743,21 +1328,16 @@ int main(int argc, char **argv)
>   
>   	pmu_sample(engines);
>   
> -	for (;;) {
> -		double t;
> -#define BUFSZ 16
> -		char freq[BUFSZ];
> -		char fact[BUFSZ];
> -		char irq[BUFSZ];
> -		char rc6[BUFSZ];
> -		char power[BUFSZ];
> -		char reads[BUFSZ];
> -		char writes[BUFSZ];
> -		struct winsize ws;
> +	while (!stop_top) {
> +		bool consumed = false;
>   		int lines = 0;
> +		struct winsize ws;
> +		double t;
>   
>   		/* Update terminal size. */
> -		if (ioctl(0, TIOCGWINSZ, &ws) != -1) {
> +		if (output_mode != INTERACTIVE) {
> +			con_w = con_h = INT_MAX;
> +		} else if (ioctl(0, TIOCGWINSZ, &ws) != -1) {
>   			con_w = ws.ws_col;
>   			con_h = ws.ws_row;
>   		}
> @@ -765,87 +1345,32 @@ int main(int argc, char **argv)
>   		pmu_sample(engines);
>   		t = (double)(engines->ts.cur - engines->ts.prev) / 1e9;
>   
> -		printf("\033[H\033[J");
> -
> -		pmu_calc(&engines->freq_req, freq, BUFSZ, 4, 0, 1.0, t, 1);
> -		pmu_calc(&engines->freq_act, fact, BUFSZ, 4, 0, 1.0, t, 1);
> -		pmu_calc(&engines->irq, irq, BUFSZ, 8, 0, 1.0, t, 1);
> -		pmu_calc(&engines->rc6, rc6, BUFSZ, 3, 0, 1e9, t, 100);
> -		pmu_calc(&engines->rapl, power, BUFSZ, 4, 2, 1.0, t,
> -			 engines->rapl_scale);
> -		pmu_calc(&engines->imc_reads, reads, BUFSZ, 6, 0, 1.0, t,
> -			 engines->imc_reads_scale);
> -		pmu_calc(&engines->imc_writes, writes, BUFSZ, 6, 0, 1.0, t,
> -			 engines->imc_writes_scale);
> -
> -		if (lines++ < con_h)
> -			printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
> -			       fact, freq, rc6, power, engines->rapl_unit, irq);
> -
> -		if (lines++ < con_h)
> -			printf("\n");
> -
> -		if (engines->imc_fd) {
> -			if (lines++ < con_h)
> -				printf("      IMC reads:   %s %s/s\n",
> -				       reads, engines->imc_reads_unit);
> -
> -			if (lines++ < con_h)
> -				printf("     IMC writes:   %s %s/s\n",
> -				       writes, engines->imc_writes_unit);
> -
> -			if (++lines < con_h)
> -				printf("\n");
> -		}
> -
> -		for (i = 0; i < engines->num_engines; i++) {
> -			struct engine *engine = engine_ptr(engines, i);
> -
> -			if (engine->num_counters && lines < con_h) {
> -				const char *a = "          ENGINE      BUSY ";
> -				const char *b = " MI_SEMA MI_WAIT";
> -
> -				printf("\033[7m%s%*s%s\033[0m\n",
> -				       a,
> -				       (int)(con_w - 1 - strlen(a) - strlen(b)),
> -				       " ", b);
> -				lines++;
> -				break;
> -			}
> -		}
> -
> -		for (i = 0; i < engines->num_engines && lines < con_h; i++) {
> -			struct engine *engine = engine_ptr(engines, i);
> -			unsigned int max_w = con_w - 1;
> -			unsigned int len;
> -			char sema[BUFSZ];
> -			char wait[BUFSZ];
> -			char busy[BUFSZ];
> -			char buf[128];
> -			double val;
> -
> -			if (!engine->num_counters)
> -				continue;
> +		if (stop_top)
> +			break;
>   
> -			pmu_calc(&engine->sema, sema, BUFSZ, 3, 0, 1e9, t, 100);
> -			pmu_calc(&engine->wait, wait, BUFSZ, 3, 0, 1e9, t, 100);
> -			len = snprintf(buf, sizeof(buf), "    %s%%    %s%%",
> -				       sema, wait);
> +		while (!consumed) {
> +			lines = print_header(engines, t, lines, con_w, con_h,
> +					     &consumed);
>   
> -			pmu_calc(&engine->busy, busy, BUFSZ, 6, 2, 1e9, t,
> -				 100);
> -			len += printf("%16s %s%% ", engine->display_name, busy);
> +			if (engines->imc_fd)
> +				lines = print_imc(engines, t, lines, con_w,
> +						  con_h);
>   
> -			val = __pmu_calc(&engine->busy.val, 1e9, t, 100);
> -			print_percentage_bar(val, max_w - len);
> +			lines = print_engines_header(engines, t, lines, con_w,
> +						     con_h);
>   
> -			printf("%s\n", buf);
> +			for (i = 0;
> +			     i < engines->num_engines && lines < con_h;
> +			     i++)
> +				lines = print_engine(engines, i, t, lines,
> +						     con_w, con_h);
>   
> -			lines++;
> +			lines = print_engines_footer(engines, t, lines, con_w,
> +						     con_h);
>   		}
>   
> -		if (lines++ < con_h)
> -			printf("\n");
> +		if (stop_top)
> +			break;
>   
>   		usleep(period_us);
>   	}
> 


--------------F18D3BC78B07663BB587A21E
Content-Type: application/x-shellscript;
 name="intel_gpu_top_plot.sh.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="intel_gpu_top_plot.sh.txt"

IyEvYmluL3NoCgppZiBbICQjIC1uZSAxIF0gfHwgWyBcISAtZiAkMSBdOyB0aGVuCgllY2hv
ICJ1c2FnZTogJHswIyMqL30gPGludGVsX2dwdV90b3AgLWwgb3V0cHV0IGZpbGU+IgoJZXhp
dCAxCmZpCgpkYXQ9JDEKZ251PSRkYXQuZ251CnN2Zz0kZGF0LnN2ZwoKZWNobyAiR251UGxv
dCdpbmcgJGRhdC4uLiIKCiMgR251cGxvdCBzZXR0aW5ncwpjYXQgPiAkZ251IDw8IEVPRgpz
ZXQgdGVybWluYWwgc3ZnIHNpemUgODAwLCAzMjAwCnNldCBvdXRwdXQgIiRzdmciCgojIG1h
cmdpbnMgZm9yIHBsb3RzLCBub3QgcGFnZQpzZXQgdG1hcmdpbiAxCnNldCBibWFyZ2luIDMK
c2V0IGxtYXJnaW4gMjAKCnNldCBtdWx0aXBsb3QgbGF5b3V0IDExLCAxIHRpdGxlICJpbnRl
bC1ncHUtdG9wIG91dHB1dDogJGRhdCIKCnNldCBncmlkCnNldCB0aWNzIG91dApzZXQgeHRp
Y3Mgbm9taXJyb3IKc2V0IHN0eWxlIGRhdGEgbGluZXMKCiMgc2hvdyBYLWF4aXMgbGFiZWwg
b25seSBmb3IgYm90dG9tIGdyYXBoCnVuc2V0IHhsYWJlbAoKc2V0IHlyYW5nZSBbIDAgOiBd
CgpzZXQgeWxhYmVsICJHUFUgZnJlcXVlbmN5IChNSHopIgpwbG90ICckZGF0JyB1c2luZyAx
IHRpdGxlICdSZXF1ZXN0JyxcXAogICAgICckZGF0JyB1c2luZyAyIHRpdGxlICdBY3R1YWwn
CgpzZXQgeWxhYmVsICJQb3dlciB1c2FnZSAoVykiCnBsb3QgJyRkYXQnIHVzaW5nIDUgdGl0
bGUgJ1VuY29yZScKCnNldCB5bGFiZWwgIlN5c3RlbSBiYW5kd2lkdGggKE1pQi9zKSIKcGxv
dCAnJGRhdCcgdXNpbmcgNiB0aXRsZSAnUmVhZHMnLFxcCiAgICAgJyRkYXQnIHVzaW5nIDcg
dGl0bGUgJ1dyaXRlcycKCnNldCB5cmFuZ2UgWyAwIDogMTAwIF0KCnNldCB5bGFiZWwgIlJD
NiAoJSkiCnBsb3QgJyRkYXQnIHVzaW5nIDQgdGl0bGUgJ0dQVScKCnNldCB5bGFiZWwgIlV0
aWxpemF0aW9uICglKSIKcGxvdCAnJGRhdCcgdXNpbmcgIDggdGl0bGUgJ1JDUy8wJyxcXAog
ICAgICckZGF0JyB1c2luZyAxMSB0aXRsZSAnQkNTLzAnLFxcCiAgICAgJyRkYXQnIHVzaW5n
IDE0IHRpdGxlICdWQ1MvMCcsXFwKICAgICAnJGRhdCcgdXNpbmcgMTcgdGl0bGUgJ1ZDUy8x
JyxcXAogICAgICckZGF0JyB1c2luZyAyMCB0aXRsZSAnVkVDUy8wJwoKc2V0IGF1dG9zY2Fs
ZSB5CnNldCB5cmFuZ2UgWyAwIDogXQoKc2V0IHlsYWJlbCAiL3MiCnBsb3QgJyRkYXQnIHVz
aW5nIDMgdGl0bGUgJ0ludGVycnVwdHMnCgpzZXQgeWxhYmVsICJFbmdpbmUgZXZlbnRzLCBz
ZSIKcGxvdCAnJGRhdCcgdXNpbmcgIDkgdGl0bGUgJ1JDUy8wJyxcXAogICAgICckZGF0JyB1
c2luZyAxMiB0aXRsZSAnQkNTLzAnLFxcCiAgICAgJyRkYXQnIHVzaW5nIDE1IHRpdGxlICdW
Q1MvMCcsXFwKICAgICAnJGRhdCcgdXNpbmcgMTggdGl0bGUgJ1ZDUy8xJyxcXAogICAgICck
ZGF0JyB1c2luZyAyMSB0aXRsZSAnVkVDUy8wJwoKc2V0IHhsYWJlbCAiU2Vjb25kcyIKCnNl
dCB5bGFiZWwgIkVuZ2luZSBldmVudHMsIHdhIgpwbG90ICckZGF0JyB1c2luZyAxMCB0aXRs
ZSAnUkNTLzAnLFxcCiAgICAgJyRkYXQnIHVzaW5nIDEzIHRpdGxlICdCQ1MvMCcsXFwKICAg
ICAnJGRhdCcgdXNpbmcgMTYgdGl0bGUgJ1ZDUy8wJyxcXAogICAgICckZGF0JyB1c2luZyAx
OSB0aXRsZSAnVkNTLzEnLFxcCiAgICAgJyRkYXQnIHVzaW5nIDIyIHRpdGxlICdWRUNTLzAn
CkVPRgoKZ251cGxvdCAkZ251CgppZiBbICQ/IC1uZSAwIF07IHRoZW4KCWVjaG8gIkVSUk9S
OiBmYWlsZWQgcnVubmluZyAnZ251cGxvdCAkZ251JyEiCglleGl0IDEKZmkKcm0gJGdudQoK
ZWNobyAiVmlldyBpbnRlbF9ncHVfdG9wIGdyYXBoIHdpdGg6IGNocm9taXVtICRzdmciCg==
--------------F18D3BC78B07663BB587A21E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--------------F18D3BC78B07663BB587A21E--
