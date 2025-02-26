Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D2DC18E7C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 15:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2855B10E945;
	Wed, 26 Feb 2025 15:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgLD0HN8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058BE10E945
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740585112; x=1772121112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OyNAOGM4exevfn0GdMHf+fVXFPyEXM7pzuA805kpmcc=;
 b=JgLD0HN85rbon4tCM+ijO5T4NUJMXDJoycz0Q0CxgoOvxKk+0COos+Ic
 NC98Gaw0JdG4Cr6/bHp97T5K+9KNe/IXBlHXq8NswJCCYJsVGx6eAgduW
 RMxwqBvKYGRZu8Tm8AS1URJmP6NQ6bhZuIRWBdcFNjRhAdP3YuDd0v+B0
 6z/Zfzk/3epdAFB4ougD/iGsEGRPysJAdhnm5oqv+FfLylst34cS+gjcN
 vEgWA9rKLSZ1gukG5kFCjJOAU+JT7Kjbaalfabo6sjZ4CO2W8l3j8E6MX
 RlJ0iC49du0W0xIB47oX6edCgFnXKwFPH0mGlCGM6xZff95ibtAiL3wCf g==;
X-CSE-ConnectionGUID: GrT8ZY4tSsm5+lESZiL7fw==
X-CSE-MsgGUID: tf1OhXYYQD+gg02MHJr7oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58856211"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="58856211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:51:52 -0800
X-CSE-ConnectionGUID: Vm6vP1UlSIaGT3JRD+YkKA==
X-CSE-MsgGUID: MR0N3wgcQmS3VV9WU6LwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121990006"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 26 Feb 2025 07:51:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 26 Feb 2025 17:51:48 +0200
Date: Wed, 26 Feb 2025 17:51:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 5/5] tools/intel_display_bandwidth: Tool for
 measuring display memory bandwidth utilization
Message-ID: <Z784lIDC8_bLQGSK@intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-6-ville.syrjala@linux.intel.com>
 <20241011175207.lzwiaqkj5ah7lmwn@kamilkon-desk.igk.intel.com>
 <Zw1H-xmKtanuPUQw@intel.com>
 <6bc5bfad4b7c5925d158e1a460fc32e395195df1.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bc5bfad4b7c5925d158e1a460fc32e395195df1.camel@intel.com>
X-Patchwork-Hint: comment
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2025 at 03:39:21PM +0000, Govindapillai, Vinod wrote:
> Hi Ville,
> 
> I think you missed one comment from Kamil...

I saw it. But no real point in reposting just for that.

> 
> "
> +	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
> 
> This function changed recently and now this code do not compile.
> Please fix and resend.
> "
> 
> The function declaration is like this now..
> 
> int intel_register_access_init(struct intel_mmio_data *mmio_data,
> 			       struct pci_device *pci_dev, int safe);
> 
> BR
> Vinod
> 
> On Mon, 2024-10-14 at 19:34 +0300, Ville Syrjälä wrote:
> > On Fri, Oct 11, 2024 at 07:52:07PM +0200, Kamil Konieczny wrote:
> > > Hi Ville,
> > > On 2024-09-16 at 23:18:41 +0300, Ville Syrjala wrote:
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > Introduce a small tool for measing the display enging
> > > s/measing/measuring/
> > > s/enging/engins/
> > > 
> > > > memory bandwidth utilization. Generally this is available
> > > > on SNB+, except on TGL/derivatives where the relevant
> > > > registers weren't updated to cope with the new ABOX layout
> > > > in the hardware.
> > > > 
> > > > Quite handy for confirming that FBC/CCS/etc. are doing their
> > > > job.
> > > > 
> > > > Not 100% sure about the required scaling factor because
> > > > bspec claims it's only needed for MTL, but my ADL definitely
> > > > needs it already.
> > > > 
> > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  lib/intel_reg.h                 |   5 +
> > > >  tools/intel_display_bandwidth.c | 171 ++++++++++++++++++++++++++++++++
> > > 
> > > Is this tool display only?
> > 
> > Yes.
> > 
> > > What about bw for opencl computations?
> > 
> > IIRC there may be some kind of total memory bandwidth counter
> > exposed via perf. I'm not aware of anything more specific than
> > that.
> > 
> > No idea if there's anything for dGPUs, eg. local mem bw, PCIe
> > link bw, etc. Would be nice to have I suppose.
> > 
> > It might be intereseting to expose the display bandwidth counter
> > via perf as well, but I haven't looked at what that would take
> > to implement.
> > 
> > > Could we have more general tool also for compute case? Then it could be
> > > named intel_gpu_bandwidth or even shorter intel_gpu_bw?
> > > 
> > > >  tools/meson.build               |   1 +
> > > >  3 files changed, 177 insertions(+)
> > > >  create mode 100644 tools/intel_display_bandwidth.c
> > > > 
> > > > diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> > > > index 26833c66f8e7..5e049d8b14d6 100644
> > > > --- a/lib/intel_reg.h
> > > > +++ b/lib/intel_reg.h
> > > > @@ -1413,6 +1413,11 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > >  #define PCH_3DRAMCGDIS0		0x46028
> > > >  #define SOUTH_DSPCLK_GATE_D	0xc2020
> > > >  
> > > > +#define DE_POWER1	0x42400
> > > > +#define DE_POWER2	0x42404
> > > > +#define DE_POWER2_ABOX0	0x42404
> > > > +#define DE_POWER2_ABOX1	0x42408
> > > > +
> > > >  #define CPU_eDP_A		0x64000
> > > >  #define PCH_DP_B		0xe4100
> > > >  #define PCH_DP_C		0xe4200
> > > > diff --git a/tools/intel_display_bandwidth.c b/tools/intel_display_bandwidth.c
> > > > new file mode 100644
> > > > index 000000000000..c7be3c390d08
> > > > --- /dev/null
> > > > +++ b/tools/intel_display_bandwidth.c
> > > > @@ -0,0 +1,171 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <getopt.h>
> > > > +#include <inttypes.h>
> > > > +#include <stdbool.h>
> > > > +#include <stdio.h>
> > > > +#include <stdlib.h>
> > > > +#include <unistd.h>
> > > > +
> > > > +#include "intel_io.h"
> > > > +#include "intel_chipset.h"
> > > > +#include "intel_reg.h"
> > > > +
> > > > +static bool has_de_power2(uint32_t devid)
> > > > +{
> > > > +	/*
> > > > +	 * TGL has DE_POWER2 but it measures the low priority traffic
> > > > +	 * on ABOX, not not actual display traffic on ABOX0/ABOX1.
> > > 
> > > s/not not/not/
> > > 
> > > > +	 */
> > > > +	if (intel_display_ver(devid) == 12)
> > > > +		return false;
> > > > +
> > > > +	return intel_display_ver(devid) >= 6 &&
> > > > +		!IS_VALLEYVIEW(devid) && !IS_CHERRYVIEW(devid);
> > > > +}
> > > > +
> > > > +static bool has_de_power2_abox0_abox1(uint32_t devid)
> > > > +{
> > > > +	/*
> > > > +	 * Despite having ABOX0/ABOX1 TGL lacks the
> > > > +	 * accompanying DE_POWER2_ABOX* registers.
> > > > +	 */
> > > > +	return intel_display_ver(devid) >= 13;
> > > > +}
> > > > +
> > > > +static int de_power2_scale(uint32_t devid)
> > > > +{
> > > > +	/*
> > > > +	 * FIXME should perhaps use something like
> > > > +	 * is_intel_dgfx() but that one wants to open the device :(
> > > > +	 */
> > > > +	switch (intel_display_ver(devid)) {
> > > > +	case 13:
> > > > +		return IS_DG2(devid) ? 1 : 2;
> > > > +	case 14:
> > > > +		return IS_BATTLEMAGE(devid) ? 1 : 2;
> > > > +	default:
> > > > +		return 1;
> > > > +	}
> > > > +}
> > > > +
> > > > +static int de_power2_unit(uint32_t devid)
> > > > +{
> > > > +	return 64 * de_power2_scale(devid);
> > > > +}
> > > > +
> > > > +static float bandwidth(uint32_t devid, int duration,
> > > > +		       uint32_t pre, uint32_t post)
> > > > +{
> > > > +	return (float)(post - pre) * de_power2_unit(devid) / (duration << 20);
> > > > +}
> > > > +
> > > > +static void measure_de_power2_abox0_abox1(uint32_t devid, unsigned int sleep_duration)
> > > > +{
> > > > +	uint32_t pre_abox0, post_abox0;
> > > > +	uint32_t pre_abox1, post_abox1;
> > > > +
> > > > +	pre_abox0 = INREG(DE_POWER2_ABOX0);
> > > > +	pre_abox1 = INREG(DE_POWER2_ABOX1);
> > > > +
> > > > +	if (sleep_duration) {
> > > > +		sleep(sleep_duration);
> > > > +
> > > > +		post_abox0 = INREG(DE_POWER2_ABOX0);
> > > > +		post_abox1 = INREG(DE_POWER2_ABOX1);
> > > > +
> > > > +		printf("DE_POWER2_ABOX0: 0x%08x->0x%08x\n",
> > > > +		       pre_abox0, post_abox0);
> > > > +		printf("DE_POWER2_ABOX1: 0x%08x->0x%08x\n",
> > > > +		       pre_abox1, post_abox1);
> > > > +
> > > > +		printf("ABOX0 bandwidth: %.2f MiB/s\n",
> > > > +		       bandwidth(devid, sleep_duration,
> > > > +				 pre_abox0, post_abox0));
> > > > +		printf("ABOX1 bandwidth: %.2f MiB/s\n",
> > > > +		       bandwidth(devid, sleep_duration,
> > > > +				 pre_abox1, post_abox1));
> > > > +		printf("Total bandwidth: %.2f MiB/s\n",
> > > > +		       bandwidth(devid, sleep_duration,
> > > > +				 pre_abox0 + pre_abox1, post_abox0 + post_abox1));
> > > > +	} else {
> > > > +		printf("DE_POWER2_ABOX0: 0x%08x\n", pre_abox0);
> > > > +		printf("DE_POWER2_ABOX1: 0x%08x\n", pre_abox1);
> > > > +	}
> > > > +}
> > > > +
> > > > +static void measure_de_power2(uint32_t devid, unsigned int sleep_duration)
> > > > +{
> > > > +	uint32_t pre, post;
> > > > +
> > > > +	pre = INREG(DE_POWER2);
> > > > +
> > > > +	if (sleep_duration) {
> > > > +		sleep(sleep_duration);
> > > > +
> > > > +		post = INREG(DE_POWER2);
> > > > +
> > > > +		printf("DE_POWER2: 0x%08x->0x%08x\n", pre, post);
> > > > +
> > > > +		printf("Total bandwidth: %.2f MiB/s\n",
> > > > +		       bandwidth(devid, sleep_duration, pre, post));
> > > > +	} else {
> > > > +		printf("DE_POWER2: 0x%08x\n", pre);
> > > > +	}
> > > > +}
> > > > +
> > > > +static void __attribute__((noreturn)) usage(const char *name)
> > > > +{
> > > > +	fprintf(stderr, "Usage: %s [options]\n"
> > > > +		" -s,--sleep <seconds>\n",
> > > 
> > > Could you also add counter -c and repeat measurement N times
> > > between sleeps?
> > 
> > Seems a bit pointless when you can just run the tool
> > in a loop.
> > 
> > > 
> > > > +		name);
> > > > +	exit(1);
> > > > +}
> > > > +
> > > > +int main(int argc, char *argv[])
> > > > +{
> > > > +	struct intel_mmio_data mmio_data;
> > > > +	unsigned int sleep_duration = 0;
> > > > +	uint32_t devid;
> > > > +
> > > > +	for (;;) {
> > > > +		static const struct option long_options[] = {
> > > > +			{ .name = "sleep", .has_arg = required_argument, },
> > > > +			{}
> > > > +		};
> > > > +
> > > > +		int opt = getopt_long(argc, argv, "s:", long_options, NULL);
> > > > +		if (opt == -1)
> > > > +			break;
> > > > +
> > > > +		switch (opt) {
> > > > +		case 's':
> > > > +			sleep_duration = atoi(optarg);
> > > > +			break;
> > > > +		default:
> > > > +			usage(argv[0]);
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	devid = intel_get_pci_device()->device_id;
> > > > +
> > > > +	if (!has_de_power2(devid)) {
> > > > +		fprintf(stderr, "Display bandwidth counter not available\n");
> > > > +		return 2;
> > > > +	}
> > > > +
> > > > +	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, -1);
> > > 
> > > This function changed recently and now this code do not compile.
> > > Please fix and resend.
> > > 
> > > Regards,
> > > Kamil
> > > 
> > > > +
> > > > +	if (has_de_power2_abox0_abox1(devid))
> > > > +		measure_de_power2_abox0_abox1(devid, sleep_duration);
> > > > +	else
> > > > +		measure_de_power2(devid, sleep_duration);
> > > > +
> > > > +	intel_register_access_fini(&mmio_data);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > diff --git a/tools/meson.build b/tools/meson.build
> > > > index 48c9a4b5089e..4e9100ddb2b7 100644
> > > > --- a/tools/meson.build
> > > > +++ b/tools/meson.build
> > > > @@ -16,6 +16,7 @@ tools_progs = [
> > > >  	'intel_audio_dump',
> > > >  	'intel_backlight',
> > > >  	'intel_bios_dumper',
> > > > +	'intel_display_bandwidth',
> > > >  	'intel_display_crc',
> > > >  	'intel_display_poller',
> > > >  	'intel_dump_decode',
> > > > -- 
> > > > 2.44.2
> > > > 
> > 
> 

-- 
Ville Syrjälä
Intel
