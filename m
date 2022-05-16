Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4352D10E898
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 08:04:33 +0000 (UTC)
Date: Mon, 16 May 2022 10:04:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20220516100421.33ed2107@maurocar-mobl2>
In-Reply-To: <20220516072444.uj77hkwi6y7kqlgt@ldmartin-desk2>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-2-mauro.chehab@linux.intel.com>
 <20220511170326.urdbuix6pkzc6rmp@ldmartin-desk2>
 <20220512084950.6667a2c7@maurocar-mobl2>
 <20220516072444.uj77hkwi6y7kqlgt@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/6] tests/core_hotunplug: properly
 finish processes using audio devices
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

On Mon, 16 May 2022 00:24:44 -0700
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Thu, May 12, 2022 at 08:49:50AM +0200, Mauro Carvalho Chehab wrote:
> >On Wed, 11 May 2022 10:03:26 -0700
> >Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >  
> >> On Fri, May 06, 2022 at 01:48:24PM +0200, Mauro Carvalho Chehab wrote:  
> >> >From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> >
> >> >Before unloading or unbinding an audio driver, all processes
> >> >that are using it must be terminated. The current logic seeks
> >> >only for alsactl, but ignore other processes, including
> >> >pulseaudio.
> >> >
> >> >Make the logic more general, extending it to any processes that
> >> >could have an open device under /dev/snd.
> >> >
> >> >It should be noticed that some distros like Fedora and openSUSE
> >> >are now migrating from pulseaudio into pipewire-pulse. Right
> >> >now, there's no standard distribution-agnostic way to request
> >> >pipewire-pulse to stop using audio devices, but there's a new
> >> >patch upstream that will make things easier:
> >> >
> >> >	https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/6ad6300ec657c88322a8cd6f3548261d3dc05359
> >> >
> >> >Which should be available for pipewire-pulse versions 0.3.50 and
> >> >upper.  
> >>
> >> this is for running tests... I don't think it's really expected to have
> >> pulseaudio or pipewire running. We should basically be doing
> >> systemctl disable/mask as a configuration step.  
> >
> >That pretty much depends on where this runs: pipewire-pulse is new.
> >Systems like Fedora and the upcoming RHEL 9 have it loaded by default. Distros
> >with older stacks usually came with pulseaudio, also enabled by default.
> >
> >See, a special-purpose machine that was carefully prepared for CI
> >testing can be configured to have pulseaudio/pipewire-pulse not installed
> >or disabled, but if those are running, they should stop using the
> >audio device before removing the device driver.
> >  
> >> And if we want to handle that, why don't we simply systemctl stop them
> >> instead of having specific commands for each of them to unbind?  
> >
> >Because it doesn't work. On Fedora 35:
> >
> >	$ sudo systemctl stop pipewire-pulse
> >	Failed to stop pipewire-pulse.service: Unit pipewire-pulse.service not loaded.  
> 
> it's on user session, not system.
> 
> 	systemctl --user disable --now pipewire-pulse.socket
> 	systemctl --user disable --now pipewire-pulse.service

Yeah, true.

> 
> My worry is that we have to keep adding logic for specific components.
> You'd probably already have to add support for wireplumber if you follow
> this logic you will also probably have to find a way to stop wireplumber
> that is the new pipewire's session manager being adopted by distros.

This patch series properly covers pipewire-pulse. It doesn't need
anything specific to different types of pipewire session manager
(wireplumber or pipewire media-session), as it uses pipewire reserve 
API logic that should work with any session manager.

Btw, I tested this series on Fedora 35 with pipewire-pulse/wireplumber
started as --user, and it properly unloaded snd-hda-intel.

I'd expect that we won't need to change anything for quite a while,
as I can't foresee yet another replacement for puseaudio.


I agree with you that the best is to disable pipewire/pulseaudio
via systemctl, but in case one forgets to do it on some system, this 
logic will still make snd-hda-intel unload work.

Besides that, I had already some bad experiences in the past with
systemd issues. Better to not rely only on it to do the right thing.

-

Btw, in long term, the best would be to actually change snd-hda-audio
for it to allow removing/reinserting i915 driver without issues
(but this may require changes at ALSA core).

> 
> 
> >	$ ps ax|grep pulse
> >	   2337 ?        S<sl 120:47 /usr/bin/pipewire-pulse
> >	$ find /etc/systemd/|grep pulse
> >	/etc/systemd/user/sockets.target.wants/pipewire-pulse.socket
> >
> >On Ubuntu 20.04:
> >
> >	$ sudo systemctl stop pulseaudio
> >	Failed to stop pulseaudio.service: Unit pulseaudio.service not loaded.
> >	$ ps ax|grep pulse
> >	   1469 ?        S<sl   0:00 /usr/bin/pulseaudio --daemonize=no --log-target=journal
> >	   2061 ?        Ssl    0:00 /usr/bin/pulseaudio --daemonize=no --log-target=journal
> >
> >	$ find /etc/systemd/|grep pulse
> >	/etc/systemd/user/default.target.wants/pulseaudio.service
> >	/etc/systemd/user/sockets.target.wants/pulseaudio.socket  
> 
> same here...         ^^^^
> 
> I don't really care much, just think not talking with each component
> directly will be lower maintenance long term and fewer chance for bugs.

I actually think just the opposite: relying that all machines in the
world that would run IGT are properly customized to not run any audio
daemons is risky and has a high chance of maintenance and bugs.

IGT should always check it before trying to unload snd-hda-intel, as
any process that would keep a /dev/snd device opened will prevent the
module unload, thus may cause issues while doing i915 unbind/rebind
(or unload/reload).

Regards,
Mauro
