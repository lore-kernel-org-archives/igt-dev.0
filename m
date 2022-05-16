Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FCF10E6B9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 16:51:26 +0000 (UTC)
Date: Mon, 16 May 2022 18:51:16 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20220516185116.1e6490b6@maurocar-mobl2>
In-Reply-To: <20220516153514.1db43c59@maurocar-mobl2>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-7-mauro.chehab@linux.intel.com>
 <YoJIUSEI0pkzqBku@intel.intel>
 <20220516153514.1db43c59@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 6/6] lib/igt_kmod: properly handle
 pipewire-pulse
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

On Mon, 16 May 2022 15:35:14 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Mon, 16 May 2022 14:49:21 +0200
> Andi Shyti <andi.shyti@linux.intel.com> wrote:
> 
> > Hi Mauro,
> >   
> > > +static void pipewire_reserve_wait(int pipewire_pulse_pid)
> > > +{
> > > +	char xdg_dir[PATH_MAX];
> > > +	const char *homedir;
> > > +	struct passwd *pw;
> > > +	proc_t *proc_info;
> > > +	PROCTAB *proc;
> > > +
> > > +	igt_fork(child, 1) {
> > > +		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> > > +
> > > +		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> > > +		igt_assert(proc != NULL);
> > > +
> > > +		while ((proc_info = readproc(proc, NULL))) {
> > > +			if (pipewire_pulse_pid == proc_info->tid)
> > > +				break;
> > > +			freeproc(proc_info);
> > > +		}
> > > +		closeproc(proc);
> > > +
> > > +		/* Sanity check: if it can't find the process, it means it has gone */
> > > +		if (pipewire_pulse_pid != proc_info->tid)
> > > +			exit(0);
> > > +
> > > +		pw = getpwuid(proc_info->euid);
> > > +		homedir = pw->pw_dir;
> > > +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> > > +		setgid(proc_info->egid);
> > > +		setuid(proc_info->euid);
> > > +		clearenv();
> > > +		setenv("HOME", homedir, 1);
> > > +		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> > > +		freeproc(proc_info);
> > > +
> > > +		exit(system("pw-reserve -n Audio0 -r"));    
> > 
> > no exit...
> >   
> > > +	}    
> > 
> > ... and waitchild().
> > 
> > Like in patch 1 :)  
> 
> OK!

Actually, no!

See, this is what happens if it calls waitchild():

	IGT-Version: 1.26-g30915d22 (x86_64) (Linux: 5.18.0-rc7-drm-ad75b5b819c9+ x86_64)
	Starting subtest: unbind-rebind
	process 12096 (alsactl) is using audio device. Should be terminated.
	process 12801 (pipewire-pulse) is using audio device. Should be requested to stop using them.
	Preventing pipewire-pulse to use the audio drivers
	Device Audio0 can not be acquired: Success
	reserve acquired
	<wait forever, as pw-reserve will run forever>

By using exit(system()) there, everything works like a charm:

	IGT-Version: 1.26-gac8dabf6 (x86_64) (Linux: 5.18.0-rc7-drm-ad75b5b819c9+ x86_64)
	Starting subtest: unbind-rebind
	process 12801 (pipewire-pulse) is using audio device. Should be requested to stop using them.
	Preventing pipewire-pulse to use the audio drivers
	Device Audio0 can not be acquired: Success
	reserve acquired
	Unloaded audio driver snd_hda_intel
	Realoading snd_hda_intel
	Subtest unbind-rebind: SUCCESS (2.755s)


See, what we want is to run pw-reserve in backgroud, then remove
snd_hda_intel and finally kill it with SIGTERM.

Regards,
Mauro
