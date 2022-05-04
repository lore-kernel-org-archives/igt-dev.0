Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245410EBB0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 07:29:01 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Wed,  4 May 2022 09:28:31 +0200
Message-Id: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Improve logic to work with audio
 dependency on DRM driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are several IGT tests that require a DRM driver to unbind or unload.

However, depending on the hardware model, the audio driver (snd_hda_intel)
hooks into the DRM driver in order to work, and the audio PCI drivers and
ALSA core currently doesn't support unbind drivers that provide them access
to the hardware, without first unbinding the audio driver.

The real fix would be to improve the audio driver's bind/unbind logic, but
this will very likely require changes at the subsystem as well. There were
some discussions in the past at the ALSA subsystem:

	https://mailman.alsa-project.org/pipermail/alsa-devel/2021-September/190279.html

But this was not addressed yet.

It should be noticed that there are some daemons like alsactl, pulseaudio and
pipewire-pulse that constantly accesses the audio hardware. So, the only way to
unbind the audio driver is to first make such apps to stop using the audio
devices.

On other words, if, for instance, snd-hda-intel is bound into i915 driver,
those are the needed steps to unbind i915 driver:

- request pulseaudio or pipewire-pulse to stop using the audio devices;
- kill all other apps that are using /dev/snd devnodes;
- unbind/unload snd-hda-intel;
- unbind or unload i915 driver.

The patches on this series warrant that the above steps will be observed,
and unifies the logic which currently has two implementations: one at IGT
library and another one at core_hotunplug.

In the specific case of snd-hda and i915 driver, the actual binding between
them depends on the actual hardware architecture. In the past, only a few
CPU/GPU models would do such binding. As documented at sound/pci/hda/hda_intel,
it used to be:

	- Haswell;
	- Broadwell;
	- Baytrail;
	- Braswell.

But nowadays, on all devices with discrete graphics GPU, the snd_hda
driver needs to hook into the i915 driver, mostly for power management.
Also, newer integrated graphics also need to bind into i915, in order
to talk with the hardware registers.

As the binding between snd_hda and i915 depends on hardware model and
changes over time, the safest way is to know for sure when such binding
exists would be if the userspace tools would report, e. g.:

	$ lsmod|grep i915.*snd
	i915                 8167424  3 snd_hda_intel

	$ cat /proc/modules |grep i915.*snd
	i915 8167424 3 snd_hda_intel, Live 0x0000000000000000

With such knowledge, userspace can better decide if how to unbind the
DRM driver. The Kernel patches adding support for such feature can be
seen at:

	https://lore.kernel.org/intel-gfx/cover.1651348913.git.mchehab@kernel.org/

This series assumes that the above patch series (or a similar one) will
be there on Kernel 5.20 (this could be changed in the future if the patch
series take a longer time to be merged).

So, if Kernel is 5.20 and /proc/modules doesn't show any dependencies
between a snd driver and the DRM driver, IGT will simply unbind the DRM
driver directly, completely ignoring the audio drivers. If the dependency
exists, the logic shoud work for any audio and DRM driver - and even allow
recursive dependencies. So, it should work even for SOC/SOF audio drivers.

If Kernel is older, it will try to unload the audio first, but then the
logic is dependent on the drivers names. This series preserve the existing
dependency chain. e. g. it expects either snd_hda_intel or snd_hdmi_lpe_audio
driver, and assumes that those are likely bind to i915 driver.
Howver, as IGT doesn't know for sure if the such binding exists, it won't
fail the IGT test if the audio unload fails, as there's a chance that
the i915 unbind would work even when this fails.

Mauro Carvalho Chehab (6):
  tests/core_hotunplug: properly finish processes using audio devices
  lib/igt_kmod: always fill who when unloading audio driver
  lib/igt_kmod: improve audio unbind logic
  core_hotunplug: fix audio unbind logic
  lib/igt_kmod: make it less pedantic with audio driver removal
  lib/igt_kmod: properly handle pipewire-pulse

 lib/igt_aux.c          | 248 ++++++++++++++++++++++++++++++++++++++
 lib/igt_aux.h          |   3 +
 lib/igt_core.c         |   7 ++
 lib/igt_core.h         |   1 +
 lib/igt_kmod.c         | 264 +++++++++++++++++++++++++++++++++++++++--
 lib/igt_kmod.h         |   2 +
 tests/core_hotunplug.c |  56 +++------
 7 files changed, 531 insertions(+), 50 deletions(-)

-- 
2.35.1
