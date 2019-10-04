Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216F26E2BE
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2019 09:23:46 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r9so5173371edl.10
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Oct 2019 02:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191003130657.11309-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20191003130657.11309-1-arkadiusz.hiler@intel.com>
From: Rhys Kidd <rhyskidd@gmail.com>
Date: Fri, 4 Oct 2019 19:23:33 +1000
Message-ID: <CA+iOQUGO8k4rjKWhq2D6ksOrUVjBozXHit6OBQXXcSmUkMTC5A@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Make README more friendly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1140481740=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1140481740==
Content-Type: multipart/alternative; boundary="00000000000034d1fe05941242f7"

--00000000000034d1fe05941242f7
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Oct 2019 at 23:07, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
wrote:

> * reorder sections so we have a more newbie friendly reading flow:
>   requirements -> building -> running
>
> * add links to documentation
>
> * drop mentions of autotools
>
> * drop piglit references
>
> * don't list dependencies, just point to Dockerfiles
>
> * mention IGT containers
>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  README.md | 280 ++++++++++++++++++++++--------------------------------
>  1 file changed, 112 insertions(+), 168 deletions(-)
>
> diff --git a/README.md b/README.md
> index b8c4c5a8..b295dc3e 100644
> --- a/README.md
> +++ b/README.md
> @@ -1,6 +1,7 @@
>  IGT GPU Tools
>  =============
>
> +
>  Description
>  -----------
>
> @@ -12,173 +13,31 @@ complicated build procedures or specific testing
> environments to get useful
>  results. Therefore, IGT GPU Tools includes low-level tools and tests
>  specifically for development and testing of the DRM Drivers.
>
> -IGT GPU Tools is split into several sections:
> -
> -**benchmarks/**
> -
> -This is a collection of useful microbenchmarks that can be used to tune
> -DRM code in relevant ways.
> -
> -The benchmarks require KMS to be enabled.  When run with an X Server
> -running, they must be run as root to avoid the authentication
> -requirement.
> -
> -Note that a few other microbenchmarks are in tests (like gem_gtt_speed).
> -
> -**tests/**
> -
> -This is a set of automated tests to run against the DRM to validate
> -changes. Many of the tests have subtests, which can be listed by using
> -the --list-subtests command line option and then run using the
> ---run-subtest option. If --run-subtest is not used, all subtests will
> -be run. Some tests have futher options and these are detailed by using
> -the --help option.
> -
> -The test suite can be run using the run-tests.sh script available in
> -the scripts directory. Piglit is used to run the tests and can either
> -be installed from your distribution (if available), or can be
> -downloaded locally for use with the script by running:
> -
> -    ./scripts/run-tests.sh -d
> -
> -run-tests.sh has options for filtering and excluding tests from test
> -runs:
> -
> -  -t <regex>      only include tests that match the regular expression
> -  -x <regex>      exclude tests that match the regular expression
> -
> -Useful patterns for test filtering are described in the API
> -documentation and the full list of tests and subtests can be produced
> -by passing -l to the run-tests.sh script.
> -
> -Results are written to a JSON file and an HTML summary can also be
> -created by passing -s to the run-tests.sh script. Further options are
> -are detailed by using the -h option.
> -
> -
> -If not using the script, piglit can be obtained from:
> -
> -    git://anongit.freedesktop.org/piglit
> -
> -There is no need to build and install piglit if it is only going to be
> -used for running i-g-t tests.
> -
> -Set the IGT_TEST_ROOT environment variable to point to the tests
> -directory, or set the path key in the "igt" section of piglit.conf to
> -the igt-gpu-tools root directory.
> -
> -The tests in the i-g-t sources need to have been built already. Then we
> -can run the testcases with (as usual as root, no other drm clients
> -running):
> -
> -    piglit-sources # ./piglit run igt <results-file>
> -
> -The testlist is built at runtime, so no need to update anything in
> -piglit when adding new tests. See
> -
> -    piglit-sources $ ./piglit run -h
> -
> -for some useful options.
> -
> -Piglit only runs a default set of tests and is useful for regression
> -testing. Other tests not run are:
> -- tests that might hang the gpu, see HANG in Makefile.am
> -- gem_stress, a stress test suite. Look at the source for all the
> -  various options.
> -- testdisplay is only run in the default mode. testdisplay has tons of
> -  options to test different kms functionality, again read the source for
> -  the details.
> -
> -**lib/**
> -
> -Common helper functions and headers used by the other tools.
> -
> -**man/**
> -
> -Manpages, unfortunately rather incomplete.
> -
> -**tools/**
> -
> -This is a collection of debugging tools that had previously been
> -built with the 2D driver but not shipped.  Some distros were hacking
> -up the 2D build to ship them.  Instead, here's a separate package for
> -people debugging the driver.
> -
> -These tools generally must be run as root, except for the ones that just
> -decode dumps.
> -
> -**docs/**
> -
> -Contains the automatically generated igt-gpu-tools libraries
> -reference documentation in docs/reference/. You need to have the
> -gtk-doc tools installed and use the "--enable-gtk-doc" configure flag
> -to generate this API documentation.
> -
> -To regenerate the html files when updating documentation, use:
> -
> -    $ ninja -C build igt-gpu-tools-doc
> -
> -If you've added/changed/removed a symbol or anything else that changes
> -the overall structure or indexes, this needs to be reflected in
> -igt-gpu-tools-sections.txt. Entirely new sections will also need to be
> -added to igt-gpu-tools-docs.xml in the appropriate place.
> -
> -**include/drm-uapi**
> -
> -Imported DRM uapi headers from airlied's drm-next branch.
> -These should be updated all together by executing "make
> -headers_install" from that branch of the kernel and then
> -copying the resulting ./usr/include/drm/*.h in and committing
> -with a note of which commit on airlied's branch was used to
> -generate them.
> +Generated documentation for the latest master is published under
> +<https://drm.pages.freedesktop.org/igt-gpu-tools/>.
>
>
>  Requirements
>  ------------
>
> -This is a non-exhaustive list of package dependencies required for
> building
> -the default configuration (package names may vary):
> +See `Dockerfiles.*` for up-to-date list of packages names in Fedora and
>

s/Dockerfiles/Dockerfile/
s/packages/package/


> +Debian.
>
> -       bison
> -       gtk-doc-tools
> -       flex
> -       libcairo2-dev
> -       libdrm-dev
> -       libkmod-dev
> -       libpixman-1-dev
> -       libpciaccess-dev
> -       libprocps-dev
> -       libudev-dev
> -       libunwind-dev
> -       liblzma-dev
> -       libdw-dev
> -       python-docutils
> -       x11proto-dri2-dev
> -       xutils-dev
> +If your distribution packages IGT you can also use your package manager to
> +install the dependencies, e.g.:
>
> -The following dependencies are required for building chamelium support
> -(package names may vary):
> +    # dnf builddep igt-gpu-tools
>
> -       libxmlrpc-core-c3-dev
> -       libudev-dev
> -       libglib2.0-dev
> -       libgsl-dev
> +But keep in mind that this may be slightly outdated and miss some
> +recently added dependencies for building the current master.
>
> -The following dependencies are requires for building audio support
> -(package names may vary):
>
> -       libasound2-dev
> -       libgsl-dev
> +Building
> +--------
>
> -See Dockerfiles.* for package names in different distributions.
> +Oneliner to get started:
>
> -Meson build system support
> ---------------------------
> -
> -Currently we support both meson and automake as build systems, but meson
> is the
> -recommended choice. Oneliner to get started:
> -
> -    $ mkdir build && meson build && cd build && ninja
> +    $ meson build && ninja -C build
>
>  Note that meson insist on separate build directories from the source tree.
>
> @@ -186,26 +45,111 @@ Running selfchecks for lib/tests and tests/ is done
> with
>
>
In v2, whilst you're here, can you also amend the prior line to properly
format the two folder
references to be consistent with the rest of this README:

  Running selfchecks for `lib/tests` and `tests/` is done with


>      $ ninja -C build test
>
> -Note that this doesn't actually run the testcases in tests/:
> scripts/run-tests.sh
> -should continue to be used for that.
> -
>  Documentation is built using
>
>      $ ninja -C build igt-gpu-tools-doc
>
> -Note that this needs meson v0.47 or later, earlier versions of meson do
> not
> -track depencies correctly for the documentation build and need:
>
> -    $ ninja -C build && ninja -C build igt-gpu-tools-doc
> +Running Tests
> +-------------
>
> -Note that there's a setup script similar to ./autogen.sh which creates a
> -compatibility Makefile with a few useful default targets:
> +In `tests/` you can find a set of automated tests to run against the DRM
> +drivers to validate your changes. Many of the tests have subtests, which
> can
> +be listed by using the `--list-subtests` command line option and then run
> +using the --run-subtest option. If `--run-subtest` is not used, all
> subtests
> +will be run. Some tests have further options and these are detailed by
> using
> +the `--help` option.
>
> -    $ ./meson.sh [make-arguments]
> +Most of the test must be run as a root and with no X or Wayland compositor
> +running.
>
> -Releases for maintainers
> -------------------------
> +    # build/tests/core_auth
> +    IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)
> +    Starting subtest: getclient-simple
> +    Subtest getclient-simple: SUCCESS (0.001s)
> +    Starting subtest: getclient-master-drop
> +    Subtest getclient-master-drop: SUCCESS (0.000s)
> +    Starting subtest: basic-auth
> +    Subtest basic-auth: SUCCESS (0.000s)
> +    Starting subtest: many-magics
> +    Subtest many-magics: SUCCESS (0.000s)
>
> -(1.14)
> +    # build/tests/core_auth --run-subtest getclient-simple
> +    IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)
> +    Starting subtest: getclient-simple
> +    Subtest getclient-simple: SUCCESS (0.000s)
>
> -http://www.x.org/wiki/Development/Documentation/ReleaseHOWTO/
> +
> +The test suite can be run using the `run-tests.sh` script available in the
> +`scripts/` directory. To use it make sure that `igt_runner` is built,
> e.g.:
> +
> +    meson -Drunner=enabled build && ninja -C build
> +
> +`run-tests.sh` has options for filtering and excluding tests from test
> +runs:
> +
> +    -t <regex>      only include tests that match the regular expression
> +    -x <regex>      exclude tests that match the regular expression
> +
> +Useful patterns for test filtering are described in the [API
> +documentation][API] and the full list of tests and subtests can be
> produced
> +by passing `-l` to the `run-tests.sh` script. Further options are are
> +detailed by using the `-h` option.
> +
> +Results are written to a JSON file.
> +
> +[API]:
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html
> +
> +
> +IGT Containers
> +--------------
> +
> +IGT is packed into nifty docker-compatible containers for ease of
> execution
> +and to avoid having to install all the dependencies. You can use
> +podman/docker to to run it on your system.
> +
> +Oneliner to get you started with the latest master:
> +
> +    # podman run --rm --priviledged
> registry.freedesktop.org/drm/igt-gpu-tools/igt:master
> +
> +
> +Other Things
> +------------
> +
> +### `benchmarks/`
> +
> +A collection of useful microbenchmarks that can be used to tune DRM code.
> +
> +The benchmarks require KMS to be enabled.  When run with an X Server
> +running, they must be run as root to avoid the authentication
> +requirement.
> +
> +Note that a few other microbenchmarks are in tests (e.g. `gem_gtt_speed`).
> +
> +### `tools/`
> +
> +A collection of debugging tools. They generally must be run as root,
> except
> +for the ones that just decode dumps.
> +
> +### `docs/`
> +
> +Contains the infrastracture to automatically generate igt-gpu-tools
> libraries
>

s/infrastracture/infrastructure/


> +reference documentation. You need to have the gtk-doc tools installed.
> +
> +To regenerate the html files when updating documentation, use:
> +
> +    $ ninja -C build igt-gpu-tools-doc
> +
> +If you've added/changed/removed a symbol or anything else that changes the
> +overall structure or indexes you need to reflect the change in
> +`igt-gpu-tools-sections.txt`. Entirely new sections also need to be added
> to
> +`igt-gpu-tools-docs.xml` in the appropriate place.
> +
> +### `include/drm-uapi/`
> +
> +Imported DRM uapi headers from airlied's drm-next branch.
> +
> +These should be updated all together by executing `make headers_install`
> from
> +that branch of the kernel and then copying the resulting
> +`./usr/include/drm/*.h` in and committing with a note of which exact
> commit
> +from the airlied's branch was used to generate them.
>

s/the//

With these couple of small nits fixed, this gets my:
Reviewed-by: Rhys Kidd <rhyskidd@gmail.com>


> --
> 2.21.0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--00000000000034d1fe05941242f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, 3 Oct 2019 at 23:07, Arkadiusz Hi=
ler &lt;<a href=3D"mailto:arkadiusz.hiler@intel.com">arkadiusz.hiler@intel.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">* reorder sections so we have a more newbie friendly reading flow:<br>
=C2=A0 requirements -&gt; building -&gt; running<br>
<br>
* add links to documentation<br>
<br>
* drop mentions of autotools<br>
<br>
* drop piglit references<br>
<br>
* don&#39;t list dependencies, just point to Dockerfiles<br>
<br>
* mention IGT containers<br>
<br>
Cc: Petri Latvala &lt;<a href=3D"mailto:petri.latvala@intel.com" target=3D"=
_blank">petri.latvala@intel.com</a>&gt;<br>
Signed-off-by: Arkadiusz Hiler &lt;<a href=3D"mailto:arkadiusz.hiler@intel.=
com" target=3D"_blank">arkadiusz.hiler@intel.com</a>&gt;<br>
---<br>
=C2=A0README.md | 280 ++++++++++++++++++++++-------------------------------=
-<br>
=C2=A01 file changed, 112 insertions(+), 168 deletions(-)<br>
<br>
diff --git a/README.md b/README.md<br>
index b8c4c5a8..b295dc3e 100644<br>
--- a/README.md<br>
+++ b/README.md<br>
@@ -1,6 +1,7 @@<br>
=C2=A0IGT GPU Tools<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
+<br>
=C2=A0Description<br>
=C2=A0-----------<br>
<br>
@@ -12,173 +13,31 @@ complicated build procedures or specific testing envir=
onments to get useful<br>
=C2=A0results. Therefore, IGT GPU Tools includes low-level tools and tests<=
br>
=C2=A0specifically for development and testing of the DRM Drivers.<br>
<br>
-IGT GPU Tools is split into several sections:<br>
-<br>
-**benchmarks/**<br>
-<br>
-This is a collection of useful microbenchmarks that can be used to tune<br=
>
-DRM code in relevant ways.<br>
-<br>
-The benchmarks require KMS to be enabled.=C2=A0 When run with an X Server<=
br>
-running, they must be run as root to avoid the authentication<br>
-requirement.<br>
-<br>
-Note that a few other microbenchmarks are in tests (like gem_gtt_speed).<b=
r>
-<br>
-**tests/**<br>
-<br>
-This is a set of automated tests to run against the DRM to validate<br>
-changes. Many of the tests have subtests, which can be listed by using<br>
-the --list-subtests command line option and then run using the<br>
---run-subtest option. If --run-subtest is not used, all subtests will<br>
-be run. Some tests have futher options and these are detailed by using<br>
-the --help option.<br>
-<br>
-The test suite can be run using the run-tests.sh script available in<br>
-the scripts directory. Piglit is used to run the tests and can either<br>
-be installed from your distribution (if available), or can be<br>
-downloaded locally for use with the script by running:<br>
-<br>
-=C2=A0 =C2=A0 ./scripts/run-tests.sh -d<br>
-<br>
-run-tests.sh has options for filtering and excluding tests from test<br>
-runs:<br>
-<br>
-=C2=A0 -t &lt;regex&gt;=C2=A0 =C2=A0 =C2=A0 only include tests that match =
the regular expression<br>
-=C2=A0 -x &lt;regex&gt;=C2=A0 =C2=A0 =C2=A0 exclude tests that match the r=
egular expression<br>
-<br>
-Useful patterns for test filtering are described in the API<br>
-documentation and the full list of tests and subtests can be produced<br>
-by passing -l to the run-tests.sh script.<br>
-<br>
-Results are written to a JSON file and an HTML summary can also be<br>
-created by passing -s to the run-tests.sh script. Further options are<br>
-are detailed by using the -h option.<br>
-<br>
-<br>
-If not using the script, piglit can be obtained from:<br>
-<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://anongit.freedesktop.org/piglit" rel=
=3D"noreferrer" target=3D"_blank">anongit.freedesktop.org/piglit</a><br>
-<br>
-There is no need to build and install piglit if it is only going to be<br>
-used for running i-g-t tests.<br>
-<br>
-Set the IGT_TEST_ROOT environment variable to point to the tests<br>
-directory, or set the path key in the &quot;igt&quot; section of piglit.co=
nf to<br>
-the igt-gpu-tools root directory.<br>
-<br>
-The tests in the i-g-t sources need to have been built already. Then we<br=
>
-can run the testcases with (as usual as root, no other drm clients<br>
-running):<br>
-<br>
-=C2=A0 =C2=A0 piglit-sources # ./piglit run igt &lt;results-file&gt;<br>
-<br>
-The testlist is built at runtime, so no need to update anything in<br>
-piglit when adding new tests. See<br>
-<br>
-=C2=A0 =C2=A0 piglit-sources $ ./piglit run -h<br>
-<br>
-for some useful options.<br>
-<br>
-Piglit only runs a default set of tests and is useful for regression<br>
-testing. Other tests not run are:<br>
-- tests that might hang the gpu, see HANG in Makefile.am<br>
-- gem_stress, a stress test suite. Look at the source for all the<br>
-=C2=A0 various options.<br>
-- testdisplay is only run in the default mode. testdisplay has tons of<br>
-=C2=A0 options to test different kms functionality, again read the source =
for<br>
-=C2=A0 the details.<br>
-<br>
-**lib/**<br>
-<br>
-Common helper functions and headers used by the other tools.<br>
-<br>
-**man/**<br>
-<br>
-Manpages, unfortunately rather incomplete.<br>
-<br>
-**tools/**<br>
-<br>
-This is a collection of debugging tools that had previously been<br>
-built with the 2D driver but not shipped.=C2=A0 Some distros were hacking<=
br>
-up the 2D build to ship them.=C2=A0 Instead, here&#39;s a separate package=
 for<br>
-people debugging the driver.<br>
-<br>
-These tools generally must be run as root, except for the ones that just<b=
r>
-decode dumps.<br>
-<br>
-**docs/**<br>
-<br>
-Contains the automatically generated igt-gpu-tools libraries<br>
-reference documentation in docs/reference/. You need to have the<br>
-gtk-doc tools installed and use the &quot;--enable-gtk-doc&quot; configure=
 flag<br>
-to generate this API documentation.<br>
-<br>
-To regenerate the html files when updating documentation, use:<br>
-<br>
-=C2=A0 =C2=A0 $ ninja -C build igt-gpu-tools-doc<br>
-<br>
-If you&#39;ve added/changed/removed a symbol or anything else that changes=
<br>
-the overall structure or indexes, this needs to be reflected in<br>
-igt-gpu-tools-sections.txt. Entirely new sections will also need to be<br>
-added to igt-gpu-tools-docs.xml in the appropriate place.<br>
-<br>
-**include/drm-uapi**<br>
-<br>
-Imported DRM uapi headers from airlied&#39;s drm-next branch.<br>
-These should be updated all together by executing &quot;make<br>
-headers_install&quot; from that branch of the kernel and then<br>
-copying the resulting ./usr/include/drm/*.h in and committing<br>
-with a note of which commit on airlied&#39;s branch was used to<br>
-generate them.<br>
+Generated documentation for the latest master is published under<br>
+&lt;<a href=3D"https://drm.pages.freedesktop.org/igt-gpu-tools/" rel=3D"no=
referrer" target=3D"_blank">https://drm.pages.freedesktop.org/igt-gpu-tools=
/</a>&gt;.<br>
<br>
<br>
=C2=A0Requirements<br>
=C2=A0------------<br>
<br>
-This is a non-exhaustive list of package dependencies required for buildin=
g<br>
-the default configuration (package names may vary):<br>
+See `Dockerfiles.*` for up-to-date list of packages names in Fedora and<br=
></blockquote><div><br></div><div>s/Dockerfiles/Dockerfile/</div><div>s/pac=
kages/package/<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+Debian.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bison<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gtk-doc-tools<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0flex<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libcairo2-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libdrm-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libkmod-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libpixman-1-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libpciaccess-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libprocps-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libudev-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libunwind-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0liblzma-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libdw-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python-docutils<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0x11proto-dri2-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xutils-dev<br>
+If your distribution packages IGT you can also use your package manager to=
<br>
+install the dependencies, e.g.:<br>
<br>
-The following dependencies are required for building chamelium support<br>
-(package names may vary):<br>
+=C2=A0 =C2=A0 # dnf builddep igt-gpu-tools<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libxmlrpc-core-c3-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libudev-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libglib2.0-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libgsl-dev<br>
+But keep in mind that this may be slightly outdated and miss some<br>
+recently added dependencies for building the current master.<br>
<br>
-The following dependencies are requires for building audio support<br>
-(package names may vary):<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libasound2-dev<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libgsl-dev<br>
+Building<br>
+--------<br>
<br>
-See Dockerfiles.* for package names in different distributions.<br>
+Oneliner to get started:<br>
<br>
-Meson build system support<br>
---------------------------<br>
-<br>
-Currently we support both meson and automake as build systems, but meson i=
s the<br>
-recommended choice. Oneliner to get started:<br>
-<br>
-=C2=A0 =C2=A0 $ mkdir build &amp;&amp; meson build &amp;&amp; cd build &am=
p;&amp; ninja<br>
+=C2=A0 =C2=A0 $ meson build &amp;&amp; ninja -C build<br>
<br>
=C2=A0Note that meson insist on separate build directories from the source =
tree.<br>
<br>
@@ -186,26 +45,111 @@ Running selfchecks for lib/tests and tests/ is done w=
ith<br>
<br></blockquote><div><br></div><div>In v2, whilst you&#39;re here, can you=
 also amend the prior line to properly format the two folder</div><div>refe=
rences to be consistent with the rest of this README:</div><div><br></div><=
div>=C2=A0 Running selfchecks for `lib/tests` and `tests/` is done with</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0$ ninja -C build test<br>
<br>
-Note that this doesn&#39;t actually run the testcases in tests/: scripts/r=
un-tests.sh<br>
-should continue to be used for that.<br>
-<br>
=C2=A0Documentation is built using<br>
<br>
=C2=A0 =C2=A0 =C2=A0$ ninja -C build igt-gpu-tools-doc<br>
<br>
-Note that this needs meson v0.47 or later, earlier versions of meson do no=
t<br>
-track depencies correctly for the documentation build and need:<br>
<br>
-=C2=A0 =C2=A0 $ ninja -C build &amp;&amp; ninja -C build igt-gpu-tools-doc=
<br>
+Running Tests<br>
+-------------<br>
<br>
-Note that there&#39;s a setup script similar to ./autogen.sh which creates=
 a<br>
-compatibility Makefile with a few useful default targets:<br>
+In `tests/` you can find a set of automated tests to run against the DRM<b=
r>
+drivers to validate your changes. Many of the tests have subtests, which c=
an<br>
+be listed by using the `--list-subtests` command line option and then run<=
br>
+using the --run-subtest option. If `--run-subtest` is not used, all subtes=
ts<br>
+will be run. Some tests have further options and these are detailed by usi=
ng<br>
+the `--help` option.<br>
<br>
-=C2=A0 =C2=A0 $ ./meson.sh [make-arguments]<br>
+Most of the test must be run as a root and with no X or Wayland compositor=
<br>
+running.<br>
<br>
-Releases for maintainers<br>
-------------------------<br>
+=C2=A0 =C2=A0 # build/tests/core_auth<br>
+=C2=A0 =C2=A0 IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)<br>
+=C2=A0 =C2=A0 Starting subtest: getclient-simple<br>
+=C2=A0 =C2=A0 Subtest getclient-simple: SUCCESS (0.001s)<br>
+=C2=A0 =C2=A0 Starting subtest: getclient-master-drop<br>
+=C2=A0 =C2=A0 Subtest getclient-master-drop: SUCCESS (0.000s)<br>
+=C2=A0 =C2=A0 Starting subtest: basic-auth<br>
+=C2=A0 =C2=A0 Subtest basic-auth: SUCCESS (0.000s)<br>
+=C2=A0 =C2=A0 Starting subtest: many-magics<br>
+=C2=A0 =C2=A0 Subtest many-magics: SUCCESS (0.000s)<br>
<br>
-(1.14)<br>
+=C2=A0 =C2=A0 # build/tests/core_auth --run-subtest getclient-simple<br>
+=C2=A0 =C2=A0 IGT-Version: 1.24 (x86_64) (Linux: 5.3.0 x86_64)<br>
+=C2=A0 =C2=A0 Starting subtest: getclient-simple<br>
+=C2=A0 =C2=A0 Subtest getclient-simple: SUCCESS (0.000s)<br>
<br>
-<a href=3D"http://www.x.org/wiki/Development/Documentation/ReleaseHOWTO/" =
rel=3D"noreferrer" target=3D"_blank">http://www.x.org/wiki/Development/Docu=
mentation/ReleaseHOWTO/</a><br>
+<br>
+The test suite can be run using the `run-tests.sh` script available in the=
<br>
+`scripts/` directory. To use it make sure that `igt_runner` is built, e.g.=
:<br>
+<br>
+=C2=A0 =C2=A0 meson -Drunner=3Denabled build &amp;&amp; ninja -C build<br>
+<br>
+`run-tests.sh` has options for filtering and excluding tests from test<br>
+runs:<br>
+<br>
+=C2=A0 =C2=A0 -t &lt;regex&gt;=C2=A0 =C2=A0 =C2=A0 only include tests that=
 match the regular expression<br>
+=C2=A0 =C2=A0 -x &lt;regex&gt;=C2=A0 =C2=A0 =C2=A0 exclude tests that matc=
h the regular expression<br>
+<br>
+Useful patterns for test filtering are described in the [API<br>
+documentation][API] and the full list of tests and subtests can be produce=
d<br>
+by passing `-l` to the `run-tests.sh` script. Further options are are<br>
+detailed by using the `-h` option.<br>
+<br>
+Results are written to a JSON file.<br>
+<br>
+[API]: <a href=3D"https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-=
tools-Core.html" rel=3D"noreferrer" target=3D"_blank">https://drm.pages.fre=
edesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html</a><br>
+<br>
+<br>
+IGT Containers<br>
+--------------<br>
+<br>
+IGT is packed into nifty docker-compatible containers for ease of executio=
n<br>
+and to avoid having to install all the dependencies. You can use<br>
+podman/docker to to run it on your system.<br>
+<br>
+Oneliner to get you started with the latest master:<br>
+<br>
+=C2=A0 =C2=A0 # podman run --rm --priviledged <a href=3D"http://registry.f=
reedesktop.org/drm/igt-gpu-tools/igt:master" rel=3D"noreferrer" target=3D"_=
blank">registry.freedesktop.org/drm/igt-gpu-tools/igt:master</a><br>
+<br>
+<br>
+Other Things<br>
+------------<br>
+<br>
+### `benchmarks/`<br>
+<br>
+A collection of useful microbenchmarks that can be used to tune DRM code.<=
br>
+<br>
+The benchmarks require KMS to be enabled.=C2=A0 When run with an X Server<=
br>
+running, they must be run as root to avoid the authentication<br>
+requirement.<br>
+<br>
+Note that a few other microbenchmarks are in tests (e.g. `gem_gtt_speed`).=
<br>
+<br>
+### `tools/`<br>
+<br>
+A collection of debugging tools. They generally must be run as root, excep=
t<br>
+for the ones that just decode dumps.<br>
+<br>
+### `docs/`<br>
+<br>
+Contains the infrastracture to automatically generate igt-gpu-tools librar=
ies<br></blockquote><div><br></div><div>s/infrastracture/infrastructure/</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+reference documentation. You need to have the gtk-doc tools installed.<br>
+<br>
+To regenerate the html files when updating documentation, use:<br>
+<br>
+=C2=A0 =C2=A0 $ ninja -C build igt-gpu-tools-doc<br>
+<br>
+If you&#39;ve added/changed/removed a symbol or anything else that changes=
 the<br>
+overall structure or indexes you need to reflect the change in<br>
+`igt-gpu-tools-sections.txt`. Entirely new sections also need to be added =
to<br>
+`igt-gpu-tools-docs.xml` in the appropriate place.<br>
+<br>
+### `include/drm-uapi/`<br>
+<br>
+Imported DRM uapi headers from airlied&#39;s drm-next branch.<br>
+<br>
+These should be updated all together by executing `make headers_install` f=
rom<br>
+that branch of the kernel and then copying the resulting<br>
+`./usr/include/drm/*.h` in and committing with a note of which exact commi=
t<br>
+from the airlied&#39;s branch was used to generate them.<br></blockquote><=
div><br></div><div>s/the//<br></div><div><br></div><div>With these couple o=
f small nits fixed, this gets my:</div><div>Reviewed-by: Rhys Kidd &lt;<a h=
ref=3D"mailto:rhyskidd@gmail.com">rhyskidd@gmail.com</a>&gt;</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
igt-dev mailing list<br>
<a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blank">igt-dev@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/igt-dev" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/igt-dev</a></blockquote></div></div>

--00000000000034d1fe05941242f7--

--===============1140481740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1140481740==--
