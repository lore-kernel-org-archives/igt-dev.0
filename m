Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBD610E206
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 03:55:50 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 6 Jun 2023 03:55:31 +0000
Message-ID: <BYAPR11MB3413AC381EBD83B7347D114DD052A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230605181753.40607-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230605181753.40607-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Don't assert if fd path is
 unreachable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Sent: Monday, June 5, 2023 11:48 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Wilson, Chris P <chris.p.wilson@intel.com>; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: [PATCH i-g-t] lib: Don't assert if fd path is unreachable
>=20
> From: Chris Wilson <chris.p.wilson@intel.com>
>=20
> Processes come and go, access to the /proc/$tid/fd/ is unreliable. Don't =
assert
> when dumping the debug info of what the process has open if that process =
is
> already destroyed.
>=20
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/igt_aux.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c index f2b9671e3..386e25783 100=
644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1451,16 +1451,18 @@ igt_show_stat(const pid_t tid, const char *cmd, i=
nt
> *state, const char *fn)  static void  __igt_lsof_fds(const pid_t tid, con=
st char
> *cmd, int *state, char *proc_path, const char *dir)  {
> +	/* default fds or kernel threads */
> +	static const char *default_fds[] =3D { "/dev/pts", "/dev/null" };
>  	struct dirent *d;
>  	struct stat st;
>  	char path[PATH_MAX];
>  	char *fd_lnk;
> +	DIR *dp;
>=20
> -	/* default fds or kernel threads */
> -	const char *default_fds[] =3D { "/dev/pts", "/dev/null" };
> +	dp =3D opendir(proc_path);
> +	if (!dp)
> +		return;
>=20
> -	DIR *dp =3D opendir(proc_path);
> -	igt_assert(dp);
>  again:
>  	while ((d =3D readdir(dp))) {
>  		char *copy_fd_lnk;
> @@ -1780,7 +1782,8 @@ __igt_lsof_audio_and_kill_proc(const pid_t tid, con=
st
> char *cmd, const uid_t eui
>  	dp =3D opendir(proc_path);
>  	if (!dp && errno =3D=3D ENOENT)
>  		return 0;
> -	igt_assert(dp);
> +	if (!dp)
> +		return 1;
>=20
>  	while ((d =3D readdir(dp))) {
>  		if (*d->d_name =3D=3D '.')
> --
> 2.39.2
