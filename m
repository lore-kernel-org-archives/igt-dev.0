Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FF6C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 16:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0278710E525;
	Wed, 28 Feb 2024 16:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rwc3EUIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B5810E525
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709136477; x=1740672477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nP0FuzV82q8ThEV2W3UVMDXCMjWNd8px53LMe1CCFc0=;
 b=Rwc3EUINC8wuccEdl0JJ1xktMG1XVkA9BTNasSHE/eDGa9FHpzgV6RuV
 HpqySmX5RGlFHdDnOpUkp5yFokBpwXIoCBSxfywNtf4YWbTemGl/2irZ/
 vliVPO4K64y/efpWFMbPY0sKbg5+N4rPbvq/jyLLBYhqzSDNWgryHB1Ld
 IaQGRVtChxz7+LcndF8o28Kq9b+/Vcs+r4Qib+AzxdDax4/dHzal8Jw1X
 AkDYbcDc1DjvrPaYMe3sXZfDvQgYVtYfdNw8A1mc8sES8acVh7+ue8LnO
 XEGwkRplI0KXES3Wxr9awQasF9IbRYrVk0Smz/k2GNmY2lb1DFSAqGOvw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7368979"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7368979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7341544"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.24.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:07:55 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 3/3] lib/igt_sysfs: make sure to write empty
 strings
Date: Wed, 28 Feb 2024 17:07:52 +0100
Message-ID: <2120220.bB369e8A3T@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3ciefsqutvjv2b32gdd57fm2pcqkt3ht2uzlkzbk6xqsevfndo@4j5bzgsku4ue>
References: <20240228063211.3662862-1-lucas.demarchi@intel.com>
 <4978543.0VBMTVartN@jkrzyszt-mobl2.ger.corp.intel.com>
 <3ciefsqutvjv2b32gdd57fm2pcqkt3ht2uzlkzbk6xqsevfndo@4j5bzgsku4ue>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Wednesday, 28 February 2024 16:54:59 CET Lucas De Marchi wrote:
> On Wed, Feb 28, 2024 at 12:13:22PM +0100, Janusz Krzysztofik wrote:
> >Hi Lucas,
> >
> >On Wednesday, 28 February 2024 07:32:11 CET Lucas De Marchi wrote:
> >> echo -n "" > /sys/module/<modulename>/parameters/<param>
> >>
> >> doesn't really work as it will just create a open() + close() expecting
> >> the file to be truncated. The same issue happens with igt as it will
> >> stop writing when there are 0 chars to write. Special case the empty
> >> string so it always write a '\0' and make sure igt_sysfs_set() accounts
> >> for the extra null char.
> >>
> >> Shell example:
> >> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
> >> 	# cat /sys/module/firmware_class/parameters/path
> >> 	/foo
> >> 	# echo -n "" > /sys/module/firmware_class/parameters/path
> >> 	/foo
> >> 	# # make sure to actually write a \0:
> >> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
> >> 	# cat /sys/module/firmware_class/parameters/path
> >>
> >> Same thing happens when testing igt_sysfs_set():
> >>        int dirfd =3D open("/sys/module/firmware_class/parameters", O_R=
DONLY);
> >>        igt_sysfs_set(dirfd, "path", "");
> >>
> >> Previously it was not really setting the param.
> >>
> >> v2:
> >>   - Fix return code from igt_sysfs_vprintf() to differentiate between
> >>     writing 1 or 0 chars (Janusz)
> >>   - Document the behavior of igt_sysfs_set() as being a higher-level
> >>     than igt_sysfs_write().
> >> v3:
> >>   - Partial "back to v1": include the \0 in the write only when writing
> >>     an empty string: there are some files in sysfs like pm_test that
> >>     don't like
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  lib/igt_sysfs.c | 33 +++++++++++++++++++++++++++++----
> >>  1 file changed, 29 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> >> index 2997925e5..2d574cc17 100644
> >> --- a/lib/igt_sysfs.c
> >> +++ b/lib/igt_sysfs.c
> >> @@ -349,6 +349,9 @@ int igt_sysfs_get_num_gt(int device)
> >>   * @len: the length to write
> >>   *
> >>   * This writes @len bytes from @data to the sysfs file.
> >> + * Contrary to igt_sysfs_set(), this does not automatically add a nul=
l char to
> >
> >Should now read something like "this does not automatically write a null=
 char
> >if len is 0", I believe.
> >
> >> + * terminate the data. It's caller responsibility to pass the right l=
en
> >> + * according to the data being written.
> >>   *
> >>   * Returns:
> >>   * The number of bytes written, or -errno on error.
> >> @@ -407,6 +410,14 @@ int igt_sysfs_read(int dir, const char *attr, voi=
d *data, int len)
> >>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
> >>  {
> >>  	int len =3D strlen(value);
> >> +
> >> +	/*
> >> +	 * Always write at least 1 char, the null byte, otherwise it
> >> +	 * won't write anything on sysfs.
> >> +	 */
> >> +	if (!len)
> >> +		len =3D 1;
> >> +
> >>  	return igt_sysfs_write(dir, attr, value, len) =3D=3D len;
> >>  }
> >>
> >> @@ -506,7 +517,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, c=
onst char *fmt, va_list ap)
> >>  {
> >>  	char stack[128], *buf =3D stack;
> >>  	va_list tmp;
> >> -	int ret, fd;
> >> +	int ret, fd, len;
> >>
> >>  	fd =3D openat(dir, attr, O_WRONLY);
> >>  	if (igt_debug_on(fd < 0))
> >> @@ -520,8 +531,18 @@ int igt_sysfs_vprintf(int dir, const char *attr, =
const char *fmt, va_list ap)
> >>  		goto end;
> >>  	}
> >>
> >> -	if (ret > sizeof(stack)) {
> >> -		unsigned int len =3D ret + 1;
> >> +	if (!ret) {
> >> +		/*
> >> +		 * Make sure to always issue a write() syscall, even if writing
> >> +		 * an empty string, otherwise values in sysfs like module
> >> +		 * parameters don't really get overwritten.  vsnprintf()
> >> +		 * guarantees to return a \0 terminated string, so just add
> >> +		 * that char. The return code is still the same as before, to
> >> +		 * abstract that from caller.
> >> +		 */
> >> +		len =3D 1;
> >> +	} else if (ret > sizeof(stack)) {
> >> +		len =3D ret + 1;
> >>
> >>  		buf =3D malloc(len);
> >>  		if (igt_debug_on(!buf)) {
> >> @@ -536,7 +557,11 @@ int igt_sysfs_vprintf(int dir, const char *attr, =
const char *fmt, va_list ap)
> >>  		}
> >>  	}
> >>
> >> -	ret =3D igt_writen(fd, buf, ret);
> >> +	ret =3D igt_writen(fd, buf, len);
> >> +
> >> +	/* Caller shouldn't know about special sysfs handling, just return 0=
 */
> >> +	if (ret =3D=3D 1 && buf[0] =3D=3D '\0')
> >> +		ret =3D 0;
> >
> >Hmm, now we no longer support writing data with null character embedded =
at
> >position 0.
>=20
> why not?
>=20
> igt_sysfs_vprintf(fd, "foo", "") will cause vsnprintf() to return 0.
> igt_sysfs_vprintf(fd, "foo", "\0") will cause vsnprintf() to return 0.
> [1]
>=20
> which is also true for both if tried like
>=20
> 	foo_val =3D "\0";
> 	igt_sysfs_vprintf(fd, "foo", "%s", foo_val);
>=20
> Is this what you are trying to differentiate or did I misunderstand?

Not with just "%s" (you better use igt_sysfs_set() for that), but possible=
=20
with e.g.

	igt_sysfs_printf(fd, attr, "%c<more_fmt>", c, ...);

Thanks,
Janusz

>=20
> there's no difference from printf/snprintf point of view, so expecting a
> return > 0 when appending \0 would be wrong.
> ( Could also be considered bad code to use *printf() family of function
> to any constant string )
>=20
> The patch seems to already handle that correctly and return 0 like snprin=
tf()
> would as far as I can see.
>=20
>=20
> Lucas De Marchi
>=20
> [ 1 ]
> 	#include <stdio.h>
>=20
> 	char buf[10];
>=20
> 	int main(int argc, const char *argv[])
> 	{
> 		int ret;
> 		char *foo_val =3D "";
> 		char *foo_val2 =3D "\0";
> 		char *foo_val3 =3D "\0test";
>=20
> 		ret =3D snprintf(buf, sizeof(buf), "");
> 		printf("ret=3D%d\n", ret);
>=20
> 		ret =3D snprintf(buf, sizeof(buf), "\0");
> 		printf("ret=3D%d\n", ret);
>=20
> 		ret =3D snprintf(buf, sizeof(buf), "\0\0\0");
> 		printf("ret=3D%d\n", ret);
>=20
> 		ret =3D snprintf(buf, sizeof(buf), "%s", foo_val);
> 		printf("ret=3D%d\n", ret);
>=20
> 		ret =3D snprintf(buf, sizeof(buf), "%s", foo_val2);
> 		printf("ret=3D%d\n", ret);
>=20
> 		ret =3D snprintf(buf, sizeof(buf), "%s", foo_val3);
> 		printf("ret=3D%d\n", ret);
>=20
> 		return 0;
> 	}
>=20
> 	$ /tmp/a
> 	ret=3D0
> 	ret=3D0
> 	ret=3D0
> 	ret=3D0
> 	ret=3D0
> 	ret=3D0
>=20
> btw, clang also warns by default about using printf like that:
>=20
> 	$ clang -o /tmp/a /tmp/a.c && /tmp/a
> 	/tmp/a.c:15:36: warning: format string contains '\0' within the string b=
ody [-Wformat]
> 		ret =3D snprintf(buf, sizeof(buf), "\0");
> 						 ~^~~
> 	/tmp/a.c:18:36: warning: format string contains '\0' within the string b=
ody [-Wformat]
> 		ret =3D snprintf(buf, sizeof(buf), "\0\0\0");
> 						 ~^~~~~~~
> 	2 warnings generated.
>=20
>=20
> and gcc with -Wall goes a little bit further and also warns on the
> empty string.
> 	/tmp/a.c: In function =E2=80=98main=E2=80=99:
> 	/tmp/a.c:12:42: warning: zero-length gnu_printf format string [-Wformat-=
zero-length]
> 	   12 |         ret =3D snprintf(buf, sizeof(buf), "");
> 	      |                                          ^~
> 	/tmp/a.c:15:43: warning: embedded =E2=80=98\0=E2=80=99 in format [-Wform=
at-contains-nul]
> 	   15 |         ret =3D snprintf(buf, sizeof(buf), "\0");
> 	      |                                           ^~
> 	/tmp/a.c:18:43: warning: embedded =E2=80=98\0=E2=80=99 in format [-Wform=
at-contains-nul]
> 	   18 |         ret =3D snprintf(buf, sizeof(buf), "\0\0\0");
> 	      | =20
>=20
> Lucas De Marchi
>=20
> >
> >How about keeping the original length of the resulting string in len?
> >Seems easy to get with your code slightly modified:
> >
> >
> > -	if (ret > sizeof(stack)) {
> > -		unsigned int len =3D ret + 1;
> >++	len =3D ret;
> > + 	if (!ret)
> > +		/*
> > +		 * Make sure to always issue a write() syscall, even if writing
> > +		 * an empty string, otherwise values in sysfs like module
> > +		 * parameters don't really get overwritten.  vsnprintf()
> > +		 * guarantees to return a \0 terminated string, so just add
> > +		 * that char. The return code is still the same as before, to
> > +		 * abstract that from caller.
> > +		 */
> > +		ret =3D 1;
> > +	} else if (ret > sizeof(stack)) {
> >-+		len =3D ret + 1;
> >-
> >- 		buf =3D malloc(len);
> >+-
> >+- 		buf =3D malloc(len);
> >++ 		buf =3D malloc(len + 1);
> >  		if (igt_debug_on(!buf)) {
> >+ 			ret =3D -ENOMEM;
> >+ 			goto end;
> >+ 		}
> >+
> >+ 		ret =3D vsnprintf(buf, ret, fmt, ap);
> >+-		if (igt_debug_on(ret > len)) {
> >++		if (igt_debug_on(ret > len + 1)) {
> >+ 			ret =3D -EINVAL;
> >+ 			goto free_buf;
> >+ 		}
> >
> >and then:
> >
> >  	}
> >
> >--	ret =3D igt_writen(fd, buf, ret);
> >-+	ret =3D igt_writen(fd, buf, len);
> >+ 	ret =3D igt_writen(fd, buf, ret);
> > +
> > +	/* Caller shouldn't know about special sysfs handling, just return 0 =
*/
> >-+	if (ret =3D=3D 1 && buf[0] =3D=3D '\0')
> >++	if (!len && ret =3D=3D 1)
> > +		ret =3D 0;
> >
> >Thanks,
> >Janusz
> >
> >
> >>
> >>  free_buf:
> >>  	if (buf !=3D stack)
> >>
> >
> >
> >
> >
>=20




