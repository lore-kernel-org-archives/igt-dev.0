Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04989B49
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 12:48:06 +0000 (UTC)
Date: Mon, 23 Mar 2020 14:48:03 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200323074605.GC26511@intel.com>
Message-ID: <alpine.DEB.2.21.2003231436460.2957@eliteleevi.tm.intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
 <20200323063248.5261-3-anshuman.gupta@intel.com>
 <824e1dd4da7f47e8b7598ac3c6d9f2fd@intel.com>
 <20200323074605.GC26511@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/5] tests/i915_pm_lpsp: lpsp
 platform agnostic support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Peres,
 Martin" <martin.peres@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hey,

On Mon, 23 Mar 2020, Anshuman Gupta wrote:

> On 2020-03-23 at 12:30:08 +0530, Peres, Martin wrote:
> > On 2020-03-23 08:32, Anshuman Gupta wrote:
> > > +	/* DP/HDMI panel requires to drive lpsp without audio */
> > > +	igt_require(unload_snd_hda_core_module());
> > 
> > I'm not super happy with having to unload modules that it would be very
> > easy to forget to re-add and would make audio tests fail :s

at least this may be painful to maintain. We have three audio drivers in 
active use (HDA snd-hda-intel, SST DSP and SOF DSP -> drivers is selected 
at runtime dependsing on hw generation, enabled features and the available 
DSP FW), and the modules you need to unload are different for all three, 
and may change over time. So not so nice to maintain if you need to 
support a large variety of hardware targets.

> > IMO, if the DUT is not playing sound, we should be able to enter LPSP.
> > If no, then I would consider this a driver bug for wasting energy
> > sending 0s to the screen.
> i915 contorls AUDIO power domain on request of i915_audio_component_ops
> get_power/put_power, which is an external dependency.
> Despite unloading the module, it fails to enter lpsp for HDMI panels, 
> audio driver didn't invoke the put_power to release the i915 power resources.
> It seems bug with audio driver interface.

Yes, this sounds like a plain bug. Audio should never keep powers
on unless it needs it for some actual use-case.

> My plan was to raise a gitlab bug based upon lpsp failure due to
> AUDIO_POWER_DOMAIN non-zero ref count despite there was no audio 
> module.
> > 
> > Thoughts on this?
> I agree with you, if there is no audio is being played from DP/hdmi
> we should be able to enter lpsp, but it seems audio codec requires 
> power at the time of codec probe itself.
> @Kai Vehmanen may be the best one to confirm hdmi-codec behavior?

Yes, audio codec asks for i915 power when it is probed, and also whenever 
it uses the HDA bus. But when it is idle, it will release i915 power via 
put_power. One possible problem could be that the audio driver is uilt 
without runtime pm support. Then it will indeed keep a ref to i915 
power all the time. Can you provide a bit of data about the 
case (which hardware, kernel config used, possible dmesg log of error)?

Br, Kai (Sound Open Firmware (SOF) team)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
