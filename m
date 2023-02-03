Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9761C10E7A8
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 14:45:12 +0000 (UTC)
Date: Fri, 3 Feb 2023 15:45:08 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230203154508.0ee405b9@maurocar-mobl2>
In-Reply-To: <87r0v6zxki.fsf@intel.com>
References: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
 <20230203082650.2454081-2-mauro.chehab@linux.intel.com>
 <874js311zb.fsf@intel.com> <20230203123729.7f32fd8f@maurocar-mobl2>
 <87r0v6zxki.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] scripts: add a parser to produce
 documentation from Kernel C file metatags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 03 Feb 2023 15:29:49 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> >> The script alone isn't enough; how do you bolt this into other
> >> documentation? More ad hoc scripting like
> >> docs/reference/igt-gpu-tools/{generate_description_xml.py,generate_programs_xml.sh}?  
> >
> > No need. This script could be called to produce, let's say, Xe documentation by adding
> > a target at tests/xe/meson.build that would do something similar to:
> >
> > 	${SRCDIR}/scripts/igt-doc ${SRCDIR}/tests/xe/*.c > ${DESTDIR}/docs/xe_tests.rst
> >
> > And CI would be running:
> >
> > 	${SRCDIR}/scripts/igt-doc ${SRCDIR}/tests/xe/*.c --check  
> 
> I think we have different ideas of what it means to *nicely* integrate

No matter what solution used, some rules are needed at meson.build to
produce documentation. One of the requirements is to have a way to validate
if the documents are updated.

So, it needs to be something that:

1. it is easy to be parsed;
2. it is easy for developers to write;
3. it is embedded at the C file that contains the tests.

Anything different than that will lead into the documentation gaps
that we currently have.

See, if you pick a couple of random IGT test files:

	$ for i in $(seq 1 10); do find tests/ -name "*.c" | shuf -n 1; done

I doubt you'll be able to quickly discover details on what each
test does (what the test does, what platforms are supported, what it is
required to run them, etc), even if you write a script to parse it.
You'll probably spend some time to find the documentation, and that's if 
they're available and updated.

By having comments inside the code like what it is proposed on this
patch, you can get them with a simple command:

	$ grep -A10 -E "\* TEST\b" $(find tests/ -name "*.c")


Assuming that we place the documentation embedded in a C file, it
means that meson.build will require some addition any way by running
some executable. As meson was built exactly with the purpose of
executing external programs (mesa, gcc, etc), calling an external
program seems *nicely integrated* to me.

Regards,
Mauro

