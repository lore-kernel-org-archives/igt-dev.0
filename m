Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6E610E3B6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 07:25:29 +0000 (UTC)
Date: Wed, 17 May 2023 09:25:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230517092524.6085346d@maurocar-mobl2>
In-Reply-To: <20230516164734.zulree7ks5j42jrs@kamilkon-desk1>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
 <20230509090738.1157939-6-mauro.chehab@linux.intel.com>
 <20230516164734.zulree7ks5j42jrs@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 5/6] tests/i915: Improve test
 documentation
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

On Tue, 16 May 2023 18:47:34 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> while I was reading 6/6 I realised that test names were stripped
> from uderscores, '_', see example below.
> 

...

> > diff --git a/tests/core_auth.c b/tests/core_auth.c
> > index 257f124820a4..ee7fbaabfa92 100644
> > --- a/tests/core_auth.c
> > +++ b/tests/core_auth.c
> > @@ -42,6 +42,27 @@
> >  #include <sys/poll.h>
> >  #include <sys/resource.h>
> >  #include "drm.h"
> > +/**
> > + * TEST: core auth  
> --------------- ^
> No underscore in test name.

That's by purpose. The idea here is just to have a summary of the contents 
of a test file.

This is produced via this python code:
 
                    if desc == '':
                        desc = re.sub(r'[-_]', ' ', basename)
                        desc = re.sub(r'\.c', '', desc)

                    out += '/**\n'
                    out += f' * TEST: {desc}\n'

It is basically the name of the file without .c and replacing
- and _ by spaces.

Please notice that the normal output, produced at build time will just ignore
it. This is only seen if one calls the tool with "--per-test" flag:

	$ ./scripts/igt_doc.py --config tests/i915/*.json --per-test --file tests/core_auth.c

	=============
	igt@core_auth
	=============

	:Category: Desktop client
	:Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
	:Feature: core
	:File: tests/core_auth.c
	:Functionality: permission management for clients
	:Sub-category: DRM
	:Summary: core auth
	:Test category: GEM_Legacy

	igt@core_auth@basic-auth
	========================

	:Description: Test magic numbers for master and slave.
	:Run type: BAT
	...

There, "core auth" is mapped there at the Summary field:

	=============
	igt@core_auth
	=============
	...	
	:Summary: core auth

The file name is always preserved, and comes from either the config file
or from the --file <files> parameter:

	:File: tests/core_auth.c

Btw, Summary is the only field that it is not inherited by subtests. All
other fields if not replaced by subtest-specific fields are inherited.
So, on a normal hierarchical output (without --per-test), we'll see them
mapped using the hierarchy defined at the JSON config file:

	./scripts/igt_doc.py --config tests/i915/*.json --file tests/core_auth.c
	
	=================================
	Implemented tests for I915 driver
	=================================

	Category: Desktop client
	========================

	Sub-category: DRM
	-----------------

	Functionality: permission management for clients
	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Feature: core
	_____________

	Run type: BAT
	~~~~~~~~~~~~~


	``igt@core_auth@basic-auth``

	:Description: Test magic numbers for master and slave.
	:Test category: GEM_Legacy

	...

Regards,
Mauro
