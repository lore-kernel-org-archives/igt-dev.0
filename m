Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4EE10ED00
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 08:36:40 +0000 (UTC)
Date: Fri, 6 May 2022 10:36:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20220506103634.48465614@maurocar-mobl2>
In-Reply-To: <YnPzIYa/TRpBMoqZ@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-2-mauro.chehab@linux.intel.com>
 <YnPzIYa/TRpBMoqZ@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/6] tests/core_hotunplug: properly
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

On Thu, 5 May 2022 17:54:09 +0200
Andi Shyti <andi.shyti@linux.intel.com> wrote:

> Hi Mauro,
>=20
> [...]
>=20
> > +static void pulseaudio_unload_module(proc_t *proc_info)
> > +{
> > +	char xdg_dir[PATH_MAX];
> > +	const char *homedir;
> > +	struct passwd *pw;
> > +
> > +	igt_fork(child, 1) {
> > +		pw =3D getpwuid(proc_info->euid);
> > +		homedir =3D pw->pw_dir;
> > +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> > +
> > +		igt_info("Ask pulseaudio to stop using audio device\n");
> > +
> > +		setgid(proc_info->egid);
> > +		setuid(proc_info->euid);
> > +		clearenv();
> > +		setenv("HOME", homedir, 1);
> > +		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> > +
> > +		exit(system("for i in $(pacmd list-sources|grep module:|cut -d : -f =
2); do pactl unload-module $i; done")); =20
>=20
> you shouldn't need for the exit()

Ok.

>=20
> > +	} =20
>=20
> do we need for igt_waitchildren() at the end?

Yes.

>=20
> > +}
> > +
> > +static int
> > +__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
> > +{
> > +	const char *audio_dev =3D "/dev/snd/";
> > +	char path[PATH_MAX * 2];
> > +	struct dirent *d;
> > +	struct stat st;
> > +	char *fd_lnk;
> > +	int fail =3D 0;
> > +	ssize_t read; =20
>=20
> nitpick: shall we move some of the variables above inside the
> while loop?

I actually like more to place the vars at the beginning, in reverse
Christmas tree order ;-)

All the above vars belong to the loop (except for fail).=20

>=20
> > +	DIR *dp =3D opendir(proc_path);
> > +	igt_assert(dp);
> > +
> > +	while ((d =3D readdir(dp))) {
> > +		if (*d->d_name =3D=3D '.')
> > +			continue; =20
>=20
> do we need to consider ".." as well? "by-path"?

Look it better: it is actually picking both "." and "..", as it is
actually ignoring everything that starts with a dot ;-)

>=20
> > +		memset(path, 0, sizeof(path));
> > +		snprintf(path, sizeof(path), "%s/%s", proc_path, d->d_name);
> > +
> > +		if (lstat(path, &st) =3D=3D -1)
> > +			continue; =20
>=20
> should this be treated as an unlikely error?

Good point. This is what __igt_lsof_fds(). I just copied it without
any changes, as an error here would break the next line:

> > +		fd_lnk =3D malloc(st.st_size + 1);

Yet, if the Kernel is producing badly formed procfs entries, I
bet the system will be unreliable enough to compete booting ;-)

> > +
> > +		igt_assert((read =3D readlink(path, fd_lnk, st.st_size + 1)));
> > +		fd_lnk[read] =3D '\0'; =20
>=20
> are we sure that in /dev/snd we have only links? In my PC I have
> only character interfaces.

No. This is not looking inside /dev/snd... the logic is actually reading
the contents of /proc/<pid>/fd. This is what is shown here on Fedora 35
for alsactl, for instance:

	$ tree /proc/1052/fd
	/proc/1052/fd
	=E2=94=9C=E2=94=80=E2=94=80 0 -> /dev/null
	=E2=94=9C=E2=94=80=E2=94=80 1 -> socket:[29993]
	=E2=94=9C=E2=94=80=E2=94=80 2 -> socket:[29993]
	=E2=94=9C=E2=94=80=E2=94=80 3 -> socket:[29997]
	=E2=94=94=E2=94=80=E2=94=80 4 -> /dev/snd/controlC0

Everything there are symlinks.

> > +		if (strncmp(audio_dev, fd_lnk, strlen(audio_dev))) {
> > +			free(fd_lnk);
> > +			continue;
> > +		}
> > +
> > +		free(fd_lnk);
> > +
> > +		/*
> > +		 * In order to avoid racing against pa/systemd, ensure that
> > +		 * pulseaudio will close all audio files. This should be
> > +		 * enough to unbind audio modules and won't case race issues =20
>=20
> /case/cause/
>=20
> > +		 * with systemd trying to reload it.
> > +		 */
> > +		if (!strcmp(proc_info->cmd, "pulseaudio")) {
> > +			pulseaudio_unload_module(proc_info);
> > +			break;
> > +		}
> > +
> > +		/*
> > +		 * FIXME: terminating pipewire-pulse is not that easy, as
> > +		 * pipewire there's no standard way up to pipewire version
> > +		 * 0.3.49. Just trying to kill pipewire will start a race
> > +		 * between IGT and systemd. If IGT wins, the audio driver
> > +		 * will be unloaded before systemd tries to reload it, but
> > +		 * if systemd wins, the audio device will be re-opened and
> > +		 * used before IGT has a chance to remove the audio driver.
> > +		 * Pipewire version 0.3.50 should bring a standard way:
> > +		 *
> > +		 * 1) start a thread running:
> > +		 *	 pw-reserve -n Audio0 -r
> > +		 * 2) unload/unbind the the audio driver(s);
> > +		 * 3) stop the pw-reserve thread.
> > +		 *
> > +		 * We should add support for it once distros start shipping it.
> > +		 */ =20
>=20
> thanks for the explanation!
>=20
> > +		/* For all other processes, just kill them */
> > +		igt_info("process %d (%s) is using audio device. Should be terminate=
d.\n",
> > +				proc_info->tid, proc_info->cmd);
> > +
> > +		if (kill(proc_info->tid, SIGTERM) < 0) {
> > +			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
> > +				proc_info->cmd, proc_info->tid);
> > +			if (kill(proc_info->tid, SIGABRT) < 0) {
> > +				fail++;
> > +				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
> > +					proc_info->cmd, proc_info->tid);
> > +			}
> > +		}
> > +
> > +		break;
> > +	}
> > +
> > +	closedir(dp);
> > +	return fail;
> > +}
> > +
> > +/*
> > + * This function identifies each process running on the machine that is
> > + * opening an audio device and tries to stop it.
> > + *
> > + * Special care should be taken with pipewire and pipewire-pulse, as t=
hose
> > + * daemons are respanned if they got killed.
> > + */
> > +int
> > +igt_lsof_kill_audio_processes(void)
> > +{
> > +	char path[PATH_MAX];
> > +	proc_t *proc_info;
> > +	PROCTAB *proc;
> > +	int fail =3D 0;
> > +
> > +	proc =3D openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG); =20
>=20
> you could eventually make an igt_openproc() with the assert as
> this is a pattern that it's repeated several times. Up to you.

Ok.

>=20
> > +	igt_assert(proc !=3D NULL);
> > +
> > +	while ((proc_info =3D readproc(proc, NULL))) {
> > +		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)=
 {
> > +			fail++; =20
>=20
> we are counting failures but using it more as a boolean. Is there
> any use of fail?

Currently no. It might be interesting to print the number of failures
in case something bad happens there. That's why I opted to use
a number.
>=20
> > +		} else {
> > +			fail +=3D __igt_lsof_kill_proc(proc_info, path);
> > +		} =20
>=20
> brackets not needed here

Will drop. I had some printfs in the middle during my tests. Forgot
removing the brackets afterwards ;-)

> > +		freeproc(proc_info);
> > +	}
> > +	closeproc(proc);
> > +
> > +	return fail;
> > +}
> > +
> >  static struct igt_siglatency {
> >  	timer_t timer;
> >  	struct timespec target;
> > diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> > index 9f2588aeca90..bb96d1afb777 100644
> > --- a/lib/igt_aux.h
> > +++ b/lib/igt_aux.h
> > @@ -306,6 +306,7 @@ bool igt_allow_unlimited_files(void);
> >  int igt_is_process_running(const char *comm);
> >  int igt_terminate_process(int sig, const char *comm);
> >  void igt_lsof(const char *dpath);
> > +int igt_lsof_kill_audio_processes(void);
> > =20
> >  #define igt_hweight(x) \
> >  	__builtin_choose_expr(sizeof(x) =3D=3D 8, \
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index f252535d5a3a..87a59245f699 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -389,7 +389,7 @@ igt_i915_driver_load(const char *opts)
> >  	return 0;
> >  }
> > =20
> > -int __igt_i915_driver_unload(const char **who)
> > +int igt_audio_driver_unload(const char **who)
> >  {
> >  	int ret;
> >  	const char *sound[] =3D {
> > @@ -398,6 +398,27 @@ int __igt_i915_driver_unload(const char **who)
> >  		NULL,
> >  	};
> > =20
> > +	for (const char **m =3D sound; *m; m++) {
> > +		if (igt_kmod_is_loaded(*m)) { =20
>=20
> little insignificant nit: with
>=20
> 	if (!igt_kmod_is_loaded(*m))
> 		continue;
>=20
> you save one level of indentation.
>=20
> > +			if (igt_lsof_kill_audio_processes())
> > +				return 1; =20
>=20
> mmhhh... I don't like the return 1 because makes this function a
> hybrid boolean/error function and we can't rely anyomore on the
> return value. Please identify a proper errno to return.


>=20
> > +
> > +			kick_snd_hda_intel();
> > +			ret =3D igt_kmod_unload(*m, 0);
> > +			if (ret) {
> > +				if (who)
> > +					*who =3D *m;
> > +				return ret;
> > +			}
> > +		}
> > +	}
> > +	return 0;
> > +} =20
>=20
> [...]
>=20
> > @@ -152,19 +152,14 @@ static void driver_unbind(struct hotunplug *priv,=
 const char *prefix,
> >  	 * safest and easiest way out.
> >  	 */
> >  	if (priv->snd_unload) {
> > -		igt_terminate_process(SIGTERM, "alsactl");
> > -
> > -		/* unbind snd_hda_intel */
> > -		kick_snd_hda_intel();
> > -
> > -		if (igt_kmod_unload("snd_hda_intel", 0)) {
> > +		if (igt_audio_driver_unload(NULL)) { =20
>=20
> why give NULL insteadd of a proper string? We can provide a
> better log.

As you noticed, I opted to do this on another patch, in order to
properly address some const char* warnings.

>=20
> >  			priv->snd_unload =3D false;
> > -			igt_warn("Could not unload snd_hda_intel\n");
> > +			igt_warn("Could not unload audio driver\n");
> >  			igt_kmod_list_loaded();
> >  			igt_lsof("/dev/snd");
> >  			igt_skip("Audio is in use, skipping\n");
> >  		} else {
> > -			igt_info("Preventively unloaded snd_hda_intel\n");
> > +			igt_info("Preventively unloaded audio driver\n");
> >  		}
> >  	} =20
>=20
> Andi
