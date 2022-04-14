Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A99C10F245
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 08:36:09 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Apr 2022 10:34:52 +0200
Message-Id: <cover.1649924725.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 0/1] Better handle video driver unload logic
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

Audio device drivers can be hooking into the video drivers, in order to
handle audio from HDMI. On such cases, the video driver usage count
will be incremented.

Before unloading or unbinding such drivers, it is needed first to ensure
that no processes are using the audio devices and that the audio
modules are either unbind or unloaded.

Currently, the logic handles alsactl in daemon mode, but it doesn't
touch pulseaudio nor any other processes that could also be using it.

Make the logic more generic, in order to cover all audio-related processes
and add an special case for pulseaudio, which requires an special request
to stop using audio devices.

With that, tests like core_hotunplug will now do the right thing, even if
pulseaudio is loaded:

	$ sudo ./build/tests/core_hotunplug --run unbind-rebind
	IGT-Version: 1.26-g776e034e (x86_64) (Linux: 5.18.0-rc2-drm-0fd740aed3bb+ x86_64)
	Starting subtest: unbind-rebind
	Ask pulseaudio to stop using audio device
	process 12919 (alsactl) is using audio device. Should be terminated.
	Preventively unloaded audio driver
	Subtest unbind-rebind: SUCCESS (2.146s)

I'm sending this as a RFC, as there are other cases that also need to be
covered there:

1. pipewire-pulse. This requires a new feature that was added at version 0.3.50,
   released last week;
2. the current code covers only snd-hda-intel and snd-hdmi-lpe-audio. Other
   audio modules may also need to be handled - like soc/sof audio drivers.

Mauro Carvalho Chehab (1):
  tests/core_hotunplug: properly finish processes using audio devices

 lib/igt_aux.c          | 141 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_aux.h          |   1 +
 lib/igt_kmod.c         |  39 ++++++++----
 lib/igt_kmod.h         |   2 +
 tests/core_hotunplug.c |  11 +---
 5 files changed, 173 insertions(+), 21 deletions(-)

-- 
2.35.1

