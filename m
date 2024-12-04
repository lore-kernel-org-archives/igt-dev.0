Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E871E7716E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 14:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9BC10ED45;
	Wed,  4 Dec 2024 14:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gH8yd47J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5810ED45
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733321462; x=1764857462;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6stqz+HWm/bVkd+QicAwIU4kmOjcrc80ykDOgNtHrc8=;
 b=gH8yd47JkbdMO3FokGryHKwU4ycZzju7llo4EuYL6w9RnioYlkLqcgW7
 arJB027FpeJ4NVT90wRA5svWJGehWVgvcxMqc3t+j836SqX5p7H/YSM3c
 IxPNXnKjYdonAFJnaAdQxl8RzgKEcqSqp+eheHwA3pYMKJMkNzCUsUSb2
 Iw1nNECGK/DvWD/KQ4OaWroazAuu3Zv0tdqGUt7+XMBaiC69lv3jDumwM
 83yNHYsl+jLYBFEyfb8/u16I4I8pY4CchSKXkwaDYawjcrv6KVKNwb200
 sA70J/DtwVzZ27lZfves4QJEEr1iBFs8jKXxSrebPe9xfsWXDBtUrHmuU A==;
X-CSE-ConnectionGUID: 5RxV78EpS2yv9ltZ9UorVg==
X-CSE-MsgGUID: 8nVBwm74T5CZUx9AKt1ZHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44064817"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44064817"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:11:02 -0800
X-CSE-ConnectionGUID: gkVgYODzSCeYGp7vFRYeJA==
X-CSE-MsgGUID: mhgUHdWSR5GTo6G4WDcyoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98586897"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:11:00 -0800
Date: Wed, 4 Dec 2024 16:11:37 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e_for_serie?=
 =?utf-8?Q?s?= starting with [CI,
 1/9] lib/igt_kmod: Remove unused module_ref
Message-ID: <Z1BjGcwyhv_qpimQ@ideak-desk.fi.intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
 <173203520559.373309.724792645696617234@b555e5b46a47>
 <jv5wepyykcudndxiszdjnumqlfmtxzvq57nw4kggydhrlhige2@rufphvdmtsu2>
 <20241203231704.GM4891@mdroper-desk1.amr.corp.intel.com>
 <2z26xmkwu2n3z2ls7xf33rlogccpjsxdradgax3qb7hyys5kbs@l6s5aeisijex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2z26xmkwu2n3z2ls7xf33rlogccpjsxdradgax3qb7hyys5kbs@l6s5aeisijex>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Dec 03, 2024 at 05:56:29PM -0600, Lucas De Marchi wrote:
> On Tue, Dec 03, 2024 at 03:17:04PM -0800, Matt Roper wrote:
> > On Thu, Nov 21, 2024 at 04:02:16PM -0600, Lucas De Marchi wrote:
> [...]
> > > > #### Possible regressions ####
> > > >
> > > >  * igt@core_hotunplug@unbind-rebind:
> > > 
> > > oh well... CI is definitely not happy with this series, hitting this:
> > > 
> > > <3> [152.880835] i915 0000:00:02.0: [drm] *ERROR* audio power refcount 1 after unbind
> > > 
> > > Need to check what's going on
> > 
> > I think that's
> > 
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3467
> > 
> > which we're now exposed to more widely by intentionally not unloading
> > the audio driver.
> 
> this series is not merged... by "now" do you mean in i915 (since this is
> extending the xe behavior to i915)?
> 
> that manual refcount in i915-display seems wrong when unbinding... the
> audio component has the get_power/put_power, but if the entrypoint to the
> unbind is via i915's call to component_del(), it shouldn't really
> matter. Both components should be able to break it.

This looks like an issue in the audio driver, not putting the power ref
during unbind. In all cases - i.e. whichever component starts it - the
unbind sequence is controled by the master component which is the audio
component here. So for instance:

i915_audio_component_cleanup()->component_del()->take_down_aggregate_device()->
  hdac_component_master_unbind()->
      (the audio driver should release all resources, including the
       display power ref)->
       component_unbind_all()->i915_audio_component_unbind()

By the time i915_audio_component_unbind() is called the power reference
should have been put already by the audio side.

> +Imre
> 
> I wonder if doing something like this would be ok and not mask other
> issues... that would match the "registered" logic we have in e.g.
> i915_pmu.c
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index c6b251f178c25..2c405e980c3a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -1285,7 +1285,8 @@ static void i915_audio_component_unbind(struct device *drv_kdev,
>  	device_link_remove(hda_kdev, drv_kdev);
> -	if (i915->display.audio.power_refcount)
> +	if (i915->display.audio.component_registered &&
> +	    i915->display.audio.power_refcount)
>  		drm_err(&i915->drm, "audio power refcount %d after unbind\n",
>  			i915->display.audio.power_refcount);
>  }
> @@ -1376,8 +1377,8 @@ static void i915_audio_component_cleanup(struct drm_i915_private *i915)
>  	if (!i915->display.audio.component_registered)
>  		return;
> -	component_del(i915->drm.dev, &i915_audio_component_bind_ops);
>  	i915->display.audio.component_registered = false;
> +	component_del(i915->drm.dev, &i915_audio_component_bind_ops);
>  }
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index 554870d2494b3..75f2a064feba7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -101,6 +101,7 @@ struct intel_audio_state {
>  struct intel_audio {
>  	/* hda/i915 audio component */
>  	struct i915_audio_component *component;
> +	/* registered and not in the process of unregistering */
>  	bool component_registered;
>  	/* mutex for audio/video sync */
>  	struct mutex mutex;
> 
> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > >    - fi-cfl-guc:         [PASS][1] -> [ABORT][2]
> > > >   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> > > >   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-9:          [PASS][3] -> [ABORT][4]
> > > >   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
> > > >   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-11:         [PASS][5] -> [ABORT][6]
> > > >   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
> > > >   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-14:         [PASS][7] -> [ABORT][8]
> > > >   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
> > > >   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg2-8:          [PASS][9] -> [ABORT][10]
> > > >   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
> > > >   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-adls-6:         [PASS][11] -> [ABORT][12]
> > > >   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
> > > >   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-rkl-11600:       [PASS][13] -> [ABORT][14]
> > > >   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
> > > >   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-dg1-7:          [PASS][15] -> [ABORT][16]
> > > >   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
> > > >   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-rpls-4:         [PASS][17] -> [ABORT][18]
> > > >   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> > > >   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-cfl-8109u:       [PASS][19] -> [ABORT][20]
> > > >   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> > > >   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-kbl-7567u:       [PASS][21] -> [ABORT][22]
> > > >   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> > > >   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> > > >    - bat-apl-1:          [PASS][23] -> [ABORT][24]
> > > >   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
> > > >   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
> > > >    - fi-tgl-1115g4:      [PASS][25] -> [ABORT][26]
> > > >   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> > > >   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> > > >
> > > >  * igt@i915_pm_rpm@module-reload:
> > > >    - bat-adlp-6:         [PASS][27] -> [ABORT][28]
> > > >   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> > > >   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> > > >    - bat-adlp-9:         [PASS][29] -> [ABORT][30]
> > > >   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
> > > >   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
> > > >    - bat-arls-5:         [PASS][31] -> [ABORT][32]
> > > >   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> > > >   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> > > >
> > > >
> > > > #### Suppressed ####
> > > >
> > > >  The following results come from untrusted machines, tests, or statuses.
> > > >  They do not affect the overall result.
> > > >
> > > >  * igt@i915_pm_rpm@module-reload:
> > > >    - {bat-arls-6}:       [PASS][33] -> [ABORT][34]
> > > >   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-6/igt@i915_pm_rpm@module-reload.html
> > > >   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-6/igt@i915_pm_rpm@module-reload.html
> > > >
> > > >
> > > > Known issues
> > > > ------------
> > > >
> > > >  Here are the changes found in IGTPW_12135 that come from known issues:
> > > >
> > > > ### IGT changes ###
> > > >
> > > > #### Issues hit ####
> > > >
> > > >  * igt@dmabuf@all-tests@dma_fence_chain:
> > > >    - fi-bsw-nick:        [PASS][35] -> [INCOMPLETE][36] ([i915#12904]) +1 other test incomplete
> > > >   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> > > >   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> > > >
> > > >  * igt@i915_selftest@live:
> > > >    - bat-arlh-3:         [PASS][37] -> [ABORT][38] ([i915#12829])
> > > >   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live.html
> > > >   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live.html
> > > >
> > > >  * igt@i915_selftest@live@workarounds:
> > > >    - bat-arlh-3:         [PASS][39] -> [ABORT][40] ([i915#12061])
> > > >   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> > > >   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> > > >
> > > >
> > > > #### Possible fixes ####
> > > >
> > > >  * igt@i915_module_load@load:
> > > >    - bat-twl-2:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
> > > >   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
> > > >   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_module_load@load.html
> > > >
> > > >  * igt@i915_selftest@live:
> > > >    - bat-mtlp-8:         [ABORT][43] ([i915#12829]) -> [PASS][44]
> > > >   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
> > > >   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live.html
> > > >
> > > >  * igt@i915_selftest@live@gt_mocs:
> > > >    - bat-twl-2:          [ABORT][45] ([i915#12919]) -> [PASS][46] +1 other test pass
> > > >   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
> > > >   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
> > > >
> > > >  * igt@i915_selftest@live@workarounds:
> > > >    - bat-mtlp-8:         [ABORT][47] -> [PASS][48]
> > > >   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> > > >   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> > > >
> > > >  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> > > >    - bat-apl-1:          [DMESG-WARN][49] -> [PASS][50] +2 other tests pass
> > > >   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> > > >   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> > > >
> > > >  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
> > > >    - bat-dg2-11:         [SKIP][51] ([i915#9197]) -> [PASS][52]
> > > >   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> > > >   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> > > >
> > > >
> > > >  {name}: This element is suppressed. This means it is ignored when computing
> > > >          the status of the difference (SUCCESS, WARNING, or FAILURE).
> > > >
> > > >  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> > > >  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
> > > >  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> > > >  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
> > > >  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
> > > >  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
> > > >
> > > >
> > > > Build changes
> > > > -------------
> > > >
> > > >  * CI: CI-20190529 -> None
> > > >  * IGT: IGT_8118 -> IGTPW_12135
> > > >
> > > >  CI-20190529: 20190529
> > > >  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
> > > >  IGTPW_12135: 12135
> > > >  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > > >
> > > > == Logs ==
> > > >
> > > > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
