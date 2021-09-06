Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4F9898A7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 06:21:57 +0000 (UTC)
Date: Mon, 6 Sep 2021 09:25:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YTW0PS1FF5XTGhmO@platvala-desk.ger.corp.intel.com>
References: <20210903140348.252686-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210903140348.252686-1-thomas.hellstrom@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] test/gem_exec_suspend: Enable the test
 for discrete GPUs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 04:03:48PM +0200, Thomas Hellstr=F6m wrote:
> Discrete GPUs don't support gem_set_caching() and uses a single,
> kernel provided mapping mode, FIXED. Adjust the test accordingly.
>=20
> This makes the test run on DG1.
>=20
> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> ---
>  tests/i915/gem_exec_suspend.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index dbe0c8a7..5f17e600 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -114,7 +114,8 @@ static void run_test(int fd, const intel_ctx_t *ctx,
> =20
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle =3D gem_create(fd, 4096);
> -	gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
> +	if (!gem_has_lmem(fd))
> +		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
>  	obj[0].flags |=3D EXEC_OBJECT_WRITE;
>  	obj[1].handle =3D gem_create(fd, 4096);
>  	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
> @@ -293,6 +294,7 @@ igt_main
>  	const struct intel_execution_engine2 *e;
>  	igt_hang_t hang;
>  	const intel_ctx_t *ctx;
> +	bool has_lmem;
>  	int fd;
> =20
>  	igt_fixture {
> @@ -302,6 +304,7 @@ igt_main
>  		ctx =3D intel_ctx_create_all_physical(fd);
> =20
>  		igt_fork_hang_detector(fd);
> +		has_lmem =3D gem_has_lmem(fd);
>  	}
> =20
>  	igt_subtest("basic")
> @@ -318,6 +321,18 @@ igt_main
>  		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
> =20
>  	for (m =3D modes; m->suffix; m++) {
> +		if (has_lmem) {
> +			igt_subtest_with_dynamic_f("fixed%s", m->suffix) {

You can't do

if (something_that_depends_on_the_running_system)
  igt_subtest_of_any_kind(...)


Instead you need to do

igt_subtest_of_any_kind(...) {
  igt_require(something_that_depends_on_the_running_system);
  ...
}


--=20
Petri Latvala



> +				for_each_ctx_engine(fd, ctx, e) {
> +					if (!gem_class_can_store_dword(fd, e->class))
> +						continue;
> +					igt_dynamic_f("%s", e->name)
> +						run_test(fd, ctx, e->flags, m->mode);
> +				}
> +			}
> +			continue;
> +		}
> +
>  		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
>  			for_each_ctx_engine(fd, ctx, e) {
>  				if (!gem_class_can_store_dword(fd, e->class))
> --=20
> 2.31.1
>=20
