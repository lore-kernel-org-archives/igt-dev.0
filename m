Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F8510FDD5
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 15:49:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso2522432pjl.4
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Aug 2022 08:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
 <20220803052654.98827-5-tales.aparecida@gmail.com>
 <Yuo2FlsJbkxFw9D0@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yuo2FlsJbkxFw9D0@platvala-desk.ger.corp.intel.com>
From: Tales <tales.aparecida@gmail.com>
Date: Wed, 3 Aug 2022 12:49:08 -0300
Message-ID: <CAGVoLp7s3UbsDXuPdjdgu5fQ21ZkHHjMDz4LjS11SRaFUcjtHA@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/igt_kmod: add igt_kselftests
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Em qua., 3 de ago. de 2022 =C3=A0s 05:48, Petri Latvala
<petri.latvala@intel.com> escreveu:
>
> On Wed, Aug 03, 2022 at 02:26:54AM -0300, Tales Aparecida wrote:
> > Add documentation for igt_kselftests functions and structs. Also adds
> > comments to non trivial lines.
> >
> > Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> > ---
> >  lib/igt_kmod.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_kmod.h |  18 +++++++++
> >  2 files changed, 125 insertions(+)
> >
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 63636243..852112cc 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -792,6 +792,12 @@ igt_amdgpu_driver_unload(void)
> >       return IGT_EXIT_SUCCESS;
> >  }
> >
> > +/*
> > + * kmsg_dump:
> > + * @fd: file descriptor for `/dev/kmsg` opened for reading
> > + *
> > + * Dump kmsg output into stderr.
> > + */
>
> The documentation comment needs to begin with /** (two *)

I forgot to mention in the cover letter, but I've followed the
recommendation of using normal comments (without the 2nd '*' in the
first line) for static symbols from GtkDoc.It's at the end of this
page: https://developer-old.gnome.org/gtk-doc-manual/stable/documenting_syn=
tax.html.en
WIth that said, I rather add the second *, as well, to enable syntax
highlighting.

>
> >  static void kmsg_dump(int fd)
> >  {
> >       char record[4096 + 1];
> > @@ -832,6 +838,13 @@ static void kmsg_dump(int fd)
> >       }
> >  }
> >
> > +/*
> > + * tests_add:
> > + * @tl: (in): test to be inserted
> > + * @list: (inout): ordered list of tests sorted by test->number
> > + *
> > + * Insert test at the correct position in the ordered list
> > + */
>
> Same for this.
>
> >  static void tests_add(struct igt_kselftest_list *tl, struct igt_list_h=
ead *list)
> >  {
> >       struct igt_kselftest_list *pos;
> > @@ -843,6 +856,14 @@ static void tests_add(struct igt_kselftest_list *t=
l, struct igt_list_head *list)
> >       igt_list_add_tail(&tl->link, &pos->link);
> >  }
> >
> > +/**
> > + * igt_kselftest_get_tests:
> > + * @kmod: (in): kernel module from which to parse module_params' names=
 into IGT tests
> > + * @filter: (in)(nullable): get only tests with a prefix matching this=
 filter
> > + * @tests: (inout): resulting ordered list of tests
> > + *
> > + * Get IGT tests' names from module_params' names, given a module.
> > + */
> >  void igt_kselftest_get_tests(struct kmod_module *kmod,
> >                            const char *filter,
> >                            struct igt_list_head *tests)
> > @@ -856,25 +877,33 @@ void igt_kselftest_get_tests(struct kmod_module *=
kmod,
> >       if (!kmod_module_get_info(kmod, &pre))
> >               return;
> >
> > +     /* iter through module infos trying to find tests, which should b=
e
> > +      * named following the pattern: "igt__{test_number}__{test_name}:=
bool",
> > +      * e.g.: "igt__18__perf_engine_cs:bool" */
>
> Multiline comments should have /* and */ on their own lines.

You're absolutely right!

>
> >       kmod_list_foreach(d, pre) {
> >               const char *key, *val;
> >               char *colon;
> >               int offset;
> >
> > +             /*  skip any info that is not a module param */
>
>                   ^^  extra space there

Nice catch!

>
> >               key =3D kmod_module_info_get_key(d);
> >               if (strcmp(key, "parmtype"))
> >                       continue;
> >
> > +             /* skip any module param that don't have the IGT test pre=
fix */
> >               val =3D kmod_module_info_get_value(d);
> >               if (!val || strncmp(val, param_prefix, prefix_len))
> >                       continue;
> >
> > +             /* alloc list-node that will store the module_param name =
*/
> >               offset =3D strlen(val) + 1;
> >               tl =3D malloc(sizeof(*tl) + offset);
> >               if (!tl)
> >                       continue;
> >
> >               memcpy(tl->param, val, offset);
> > +
> > +             /* find and replace colon with \0 to discard module_param=
 type */
> >               colon =3D strchr(tl->param, ':');
> >               *colon =3D '\0';
> >
> > @@ -884,6 +913,7 @@ void igt_kselftest_get_tests(struct kmod_module *km=
od,
> >                          &tl->number, &offset) =3D=3D 1)
> >                       tl->name +=3D offset;
> >
> > +             /* skip any test that doesn't match the prefix filter */
> >               if (filter && strncmp(tl->name, filter, strlen(filter))) =
{
> >                       free(tl);
> >                       continue;
> > @@ -902,6 +932,22 @@ static int open_parameters(const char *module_name=
)
> >       return open(path, O_RDONLY);
> >  }
> >
> > +/**
> > + * igt_kselftest_init:
> > + * @tst: (inout): pointer of #igt_kselftest to be initialized
> > + * @module_name: (in): name of the module with IGT tests declared as m=
odule_params
> > + *
> > + * Initialize the given struct igt_kselftest and the inner struct kmod=
_module.
> > + *
> > + * @Note: This function initialize @tst->kmsg with `-1`, call
> > + * igt_kselftest_begin() to actually open the <filename>/dev/kmsg</fil=
ename> stream.
> > + * @tst->module_name should be freed by the caller with free(), @tst->=
kmod
> > + * refcount needs to be decremented to be released using
> > + * <function>kmod_module_unref</function>.
> > + *
> > + * Returns: 0 on success, non-zero otherwise. It fails if name is not =
a valid
> > + * module name or if memory allocation failed.
> > + */
> >  int igt_kselftest_init(struct igt_kselftest *tst,
> >                      const char *module_name)
> >  {
> > @@ -922,6 +968,17 @@ int igt_kselftest_init(struct igt_kselftest *tst,
> >       return 0;
> >  }
> >
> > +/**
> > + * igt_kselftest_begin:
> > + * @tst: (inout): pointer to #igt_kselftest with `kmod_module` handler=
 to unload
> > + *   and where the file descriptor for <filename>/dev/kmsg</filename> =
will be
> > + *   stored.
> > + *
> > + * Unload the module that will be tested and open kmsg to start readin=
g it.
> > + * If module is i915, unloads some of its dependencies as well.
> > + *
> > + * Returns: 0 on success, non-zero otherwise.
> > + */
> >  int igt_kselftest_begin(struct igt_kselftest *tst)
> >  {
> >       int err;
> > @@ -939,6 +996,21 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
> >       return 0;
> >  }
> >
> > +/**
> > + * igt_kselftest_execute:
> > + * @tst: (in): handler for module to be tested and inner kmsg file des=
criptor
> > + * @tl: (in): contains the name of the test to be executed
> > + * @options: (in)(nullable): Extra parameters for the module. NULL in =
case no
> > + *   parameters are to be passed, or a '\0' terminated string otherwis=
e.
> > + * @result: (in)(nullable): NULL if the result of loading the module s=
hould be
> > + *   returned, or a '\0' terminated string with the name of the module=
_param
> > + *   holding the test's result, if that should be returned instead.
> > + *
> > + * Execute the given test by loading the module and asserts its succes=
s.
> > + *
> > + * Returns: 0 on success, non-zero otherwise. If @result is set, retur=
ns the
> > + * value from the given module_param after running the test.
> > + */
> >  int igt_kselftest_execute(struct igt_kselftest *tst,
> >                         struct igt_kselftest_list *tl,
> >                         const char *options,
> > @@ -952,6 +1024,7 @@ int igt_kselftest_execute(struct igt_kselftest *ts=
t,
> >
> >       lseek(tst->kmsg, 0, SEEK_END);
> >
> > +     /* prepare modprobe parameters to enable a test with extra option=
s */
> >       snprintf(buf, sizeof(buf), "%s=3D1 %s", tl->param, options ?: "")=
;
> >
> >       err =3D modprobe(tst->kmod, buf);
> > @@ -977,18 +1050,40 @@ int igt_kselftest_execute(struct igt_kselftest *=
tst,
> >       return err;
> >  }
> >
> > +/**
> > + * igt_kselftest_end:
> > + * @tst: (in): handler for module to be unloaded and kmsg file descrip=
tor
> > + *
> > + * Unload the module and close the kmsg file descriptor.
> > + */
> >  void igt_kselftest_end(struct igt_kselftest *tst)
> >  {
> >       kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
> >       close(tst->kmsg);
> >  }
> >
> > +/**
> > + * igt_kselftest_fini:
> > + * @tst: (in): container of items to be freed
> > + *
> > + * Free memory from @tst->module_name and remove reference for @tst->k=
mod
> > + */
> >  void igt_kselftest_fini(struct igt_kselftest *tst)
> >  {
> >       free(tst->module_name);
> >       kmod_module_unref(tst->kmod);
> >  }
> >
> > +/*
> > + * unfilter:
> > + * @filter: (in)(nullable): prefix to be removed
> > + * @name: (in): string to be trimmed
> > + *
> > + * Remove prefix @filter from @name, removing an additional non-alpha =
char,
> > + * if there's one.
> > + *
> > + * Returns: a pointer to the resulting string
> > + */
>
> Another doc block without /**
>
>
> --
> Petri Latvala
>
>
> >  static const char *unfilter(const char *filter, const char *name)
> >  {
> >       if (!filter)
> > @@ -1001,6 +1096,18 @@ static const char *unfilter(const char *filter, =
const char *name)
> >       return name;
> >  }
> >
> > +/**
> > + * igt_kselftests:
> > + * @module_name: (in): name of the module to find and run tests for
> > + * @options: (in)(nullable): Extra parameters for the module. NULL in =
case no
> > + *   parameters are to be passed, or a '\0' terminated string otherwis=
e.
> > + * @result: (in)(nullable): NULL if the result of loading the module s=
hould be
> > + *   returned, or a '\0' terminated string with the name of the module=
_param
> > + *   holding the test's result, if that should be returned instead.
> > + * @filter: (in)(nullable): run only tests with a prefix matching this=
 filter
> > + *
> > + * Find and execute kselftests defined as module_params of the given m=
odule.
> > + */
> >  void igt_kselftests(const char *module_name,
> >                   const char *options,
> >                   const char *result,
> > diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> > index f98dd29f..4f81641b 100644
> > --- a/lib/igt_kmod.h
> > +++ b/lib/igt_kmod.h
> > @@ -50,12 +50,30 @@ void igt_kselftests(const char *module_name,
> >                   const char *result_option,
> >                   const char *filter);
> >
> > +/**
> > + * igt_kselftest:
> > + * @kmod: reference for <structname>kmod_module</structname> used to l=
oad and
> > + *   unload the module
> > + * @module_name: name of the module containing the kselftests for IGT
> > + * @kmsg: holds a file descriptor for <filename>/dev/kmsg</filename>
> > + *
> > + * Handle a kernel module with kselftests and their output
> > + */
> >  struct igt_kselftest {
> >       struct kmod_module *kmod;
> >       char *module_name;
> >       int kmsg;
> >  };
> >
> > +/**
> > + * igt_kselftest_list:
> > + * @link: doubly linked list attributes
> > + * @number: defines the relative position of each element in the order=
ed list
> > + * @name: pointer to the test's name, a suffix of <structfield>param</=
structfield>
> > + * @param: name of the module_param that enables/disables the test
> > + *
> > + * Node of an ordered list of test names
> > + */
> >  struct igt_kselftest_list {
> >       struct igt_list_head link;
> >       unsigned int number;
> > --
> > 2.37.0
> >

Thanks for the review, Petri
