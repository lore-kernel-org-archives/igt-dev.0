Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7451210E5AA
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 11:42:04 +0000 (UTC)
Date: Tue, 27 Sep 2022 13:41:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20220927134158.3269d129@maurocar-mobl2>
In-Reply-To: <20220921155801.13c2de96@maurocar-mobl2>
References: <20220921102940.15121-1-kamil.konieczny@linux.intel.com>
 <20220921102940.15121-2-kamil.konieczny@linux.intel.com>
 <20220921155801.13c2de96@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH RFC i-g-t v1 1/2] tests/i915/gem_basic:
 convert to multithreaded multi-GPUs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 21 Sep 2022 15:58:01 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> Hi Kamil,

> > @@ -48,6 +49,7 @@ test_bad_close(int fd)
> >  	int ret;
> > =20
> >  	igt_info("Testing error return on bad close ioctl.\n");
> > +	igt_info("%s: pid: %d, tid: %lu, CPU: %d\n", __func__, getpid(), pthr=
ead_self(), sched_getcpu()); =20
>=20
> Hmm... perhaps we should add pid at igt_info(), for multi-GPU scenarios, =
e. g.
> when IGT was asked to run with more than one GPUs.
>=20
> Not sure if it makes sense to display tid/CPU here.

Btw, what I would do, instead, would be something like using the encosed
patch to store GPU data, filling "gpu_string" at the macro that would handle
multiple GPUs.

A poor usage of it would be to use something similar to the enclosed patch[=
1]
calling set_gpu_string inside the pthread.

<code>
diff --git a/lib/drmtest.c b/lib/drmtest.c
index 16e80bdfcfb1..d16cd4f78edd 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -288,6 +288,8 @@ static int __search_and_open(const char *base, int offs=
et, unsigned int chipset,
=20
 		sprintf(name, "%s%u", base, i + offset);
=20
+		set_gpu_string(name);
+
 		if (_is_already_opened(name, as_idx))
 			continue;
</code>

With that, the subtest return code would print:

	$ sudo ./build/tests/gem_basic --run bad-close
	IGT-Version: 1.26-g336bb75c0d5b (x86_64) (Linux: 5.19.0-drm-50bc22230125+ =
x86_64)
	Starting subtest: bad-close
	Testing error return on bad close ioctl.
	/dev/dri/card0: Subtest bad-close: SUCCESS (0.000s)

Yet, instead of placing card0 or PID, I would try to place something that
better describe the GPU - e. g. GPU model and/or something similar to=20
what "lspci -m" outputs. So, for this GPU, for instance:

	$ lspci -s "00:02.0"
	00:02.0 VGA compatible controller: Intel Corporation TigerLake-LP GT2 [Iri=
s Xe Graphics] (rev 01)

I would set gpu_string to something like: "00:02.0 TGL(8086:9a49)".

Regards,
Mauro

---

=46rom 6bd937a3e0758ed284597748d0d3b65861f365e4 Mon Sep 17 00:00:00 2001
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 27 Sep 2022 13:03:10 +0200
Subject: [PATCH] o lib/igt_core: add a logic to store a GPU string

This is helpful on tests that run with multiple GPUs.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

diff --git a/lib/igt_core.c b/lib/igt_core.c
index dc6486c841f0..1807a7b5a1da 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1453,6 +1453,16 @@ bool __igt_enter_dynamic_container(void)
 	return true;
 }
=20
+static __thread char *gpu_string =3D NULL;
+
+void set_gpu_string(const char *string)
+{
+	if (gpu_string)
+		free(gpu_string);
+	gpu_string =3D strdup(string);
+	igt_assert(gpu_string);
+}
+
 __noreturn static void exit_subtest(const char *result)
 {
 	struct timespec now;
@@ -1463,6 +1473,9 @@ __noreturn static void exit_subtest(const char *resul=
t)
=20
 	igt_gettime(&now);
=20
+	if (gpu_string)
+		igt_info("%s: ", gpu_string);
+
 	igt_info("%s%s %s: %s (%.3fs)%s\n",
 		 (!__igt_plain_output) ? "\x1b[1m" : "",
 		 subtest_text, *subtest_name, result,
diff --git a/lib/igt_core.h b/lib/igt_core.h
index f21723dec4bc..3a481fe6f67f 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1492,4 +1492,10 @@ static inline void igt_pci_system_cleanup(void)
 {
 }
=20
+/**
+ * set_gpu_string():
+ * Sets a string to describe the GPU being tested
+ */
+void set_gpu_string(const char *string);
+
 #endif /* IGT_CORE_H */
