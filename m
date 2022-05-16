Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACC10FBB2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 13:23:50 +0000 (UTC)
Date: Mon, 16 May 2022 15:23:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20220516152345.73594fca@maurocar-mobl2>
In-Reply-To: <YoJEAiNy8LwjpB6V@intel.intel>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
 <YoJEAiNy8LwjpB6V@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/6] lib/igt_kmod: improve audio
 unbind logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andi,

On Mon, 16 May 2022 14:30:58 +0200
Andi Shyti <andi.shyti@linux.intel.com> wrote:

> Hi Mauro,
> 
> > +	/* Recursively remove all drivers that depend on drm_driver */
> > +	for (j = 0; j < mod[i].num_required; j++) {
> > +		pos = mod[i].required_by[j];
> > +		if (who)
> > +			*who = strdup(mod[pos].name);  
> 
> how many who are we "strdupping"?

Currently, with i915, there's just one module that will actually be
removed here - either snd_hda_intel or snd_hdmi_lpe_audio (on Atom).

If a SOC/SOF driver would end use this interface, then maybe up to
a dozen modules might need to be unloaded, depending on codecs and
other ancillary drivers. For instance, those are the modules I have
here on a personal machine with uses sof/soc:

	$ lsmod|grep snd
	snd_seq_dummy          16384  0
	snd_hrtimer            16384  1
	snd_soc_sof_es8336     20480  0
	snd_soc_intel_hda_dsp_common    20480  1 snd_soc_sof_es8336
	snd_hda_codec_hdmi     73728  0
	snd_hda_codec_realtek   163840  0
	snd_hda_codec_generic    98304  1 snd_hda_codec_realtek
	snd_soc_dmic           16384  0
	snd_sof_pci_intel_cnl    16384  0
	snd_sof_intel_hda_common   110592  1 snd_sof_pci_intel_cnl
	soundwire_intel        45056  1 snd_sof_intel_hda_common
	snd_sof_intel_hda      20480  1 snd_sof_intel_hda_common
	snd_sof_pci            20480  2 snd_sof_intel_hda_common,snd_sof_pci_intel_cnl
	snd_sof_xtensa_dsp     16384  1 snd_sof_intel_hda_common
	snd_sof               167936  2 snd_sof_pci,snd_sof_intel_hda_common
	snd_soc_skl           176128  0
	snd_soc_hdac_hda       24576  2 snd_sof_intel_hda_common,snd_soc_skl
	snd_hda_ext_core       36864  4 snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_skl,snd_sof_intel_hda
	snd_soc_sst_ipc        20480  1 snd_soc_skl
	snd_soc_sst_dsp        36864  1 snd_soc_skl
	snd_soc_acpi_intel_match    61440  3 snd_sof_intel_hda_common,snd_soc_skl,snd_sof_pci_intel_cnl
	snd_soc_acpi           16384  3 snd_soc_acpi_intel_match,snd_sof_intel_hda_common,snd_soc_skl
	snd_hda_intel          57344  0
	snd_intel_dspcfg       32768  3 snd_hda_intel,snd_sof_intel_hda_common,snd_soc_skl
	snd_intel_sdw_acpi     20480  2 snd_sof_intel_hda_common,snd_intel_dspcfg
	ledtrig_audio          16384  3 snd_hda_codec_generic,huawei_wmi,snd_sof
	snd_hda_codec         172032  6 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_realtek,snd_soc_intel_hda_dsp_common,snd_soc_hdac_hda
	snd_hda_core          110592  11 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_ext_core,snd_hda_codec,snd_hda_codec_realtek,snd_soc_intel_hda_dsp_common,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_skl,snd_sof_intel_hda
	snd_soc_es8316         53248  0
	snd_hwdep              16384  1 snd_hda_codec
	snd_soc_core          348160  8 soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_sof_es8336,snd_soc_skl,snd_soc_es8316,snd_soc_dmic
	snd_compress           28672  1 snd_soc_core
	ac97_bus               16384  1 snd_soc_core
	snd_pcm_dmaengine      16384  1 snd_soc_core
	snd_seq                90112  7 snd_seq_dummy
	snd_seq_device         16384  1 snd_seq
	snd_pcm               151552  12 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_compress,snd_soc_core,snd_soc_skl,snd_soc_es8316,snd_hda_core,snd_pcm_dmaengine
	snd_timer              49152  3 snd_seq,snd_hrtimer,snd_pcm
	snd                   114688  16 snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_sof,snd_timer,snd_compress,snd_soc_core,snd_soc_sof_es8336,snd_pcm
	soundcore              16384  1 snd

but I dunno if some drivers in this chain is bound to i915.

In any case, I opted to make the logic there generic enough to cover complex cases with a module dependency chain.

> Are they freed anywhere?

Currently, they aren't freed. I can change the logic to free it, if there is
already an allocated pointer, e. g. something like:

	if (who) {
		if (*who)
			free(*who);
		*who = strdup(mod[pos].name);
	}

With that, there will be either a single one small string allocated or
a pointer to a static const char.

> > +		/*
> > +		 * If a sound driver depends on drm_driver, kill audio processes
> > +		 * first, in order to make it possible to unload the driver
> > +		 */
> > +		if (strstr(mod[pos].name, "snd")) {
> > +			if (igt_lsof_kill_audio_processes()) {
> > +				ret = EACCES;
> > +				goto ret;
> > +			}
> > +		}
> > +		ret = igt_unload_driver(mod, num_mod, pos);
> > +	}
> > +
> > +ret:
> > +	free_module_ref(mod, num_mod);
> > +
> > +	return ret;
> > +}  
