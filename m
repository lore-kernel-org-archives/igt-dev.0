Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F4610E776
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:12:12 +0000 (UTC)
Date: Tue, 14 Mar 2023 12:12:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230314121207.3d6077ed@maurocar-mobl2>
In-Reply-To: <87lejz7n5t.fsf@intel.com>
References: <20230314065344.589589-1-mauro.chehab@linux.intel.com>
 <87lejz7n5t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] meson: build Xe test documentation
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

On Tue, 14 Mar 2023 10:27:42 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Tue, 14 Mar 2023, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > diff --git a/scripts/gen_rst_index b/scripts/gen_rst_index
> > new file mode 100755
> > index 000000000000..0b9d677083d4
> > --- /dev/null
> > +++ b/scripts/gen_rst_index
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +## Copyright (C) 2023    Intel Corporation                 ##
> > +## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
> > +##                                                         ##
> > +## Small script to produce a ReST index file               ##
> > +
> > +#!/bin/bash -e  
> 
> Hashbang only works on the first line.

Yeah. That's probably introduced by some rebase. Just resent a
new version addressing it.

> 
> BR,
> Jani.
> 
> 
> 
> > +
> > +if [ $# -lt 3 ]; then
> > +	echo 'Usage: $0: <title> <files> <dest_dir>' >&2
> > +	exit 1
> > +fi
> > +
> > +title=$1
> > +shift
> > +
> > +args=( "$@" )
> > +
> > +dest_dir=${args[${#args[@]}-1]}
> > +unset args[${#args[@]}-1]
> > +
> > +if [ ! -d $dest_dir ]; then
> > +	echo "Error: $dest_dir directory doesn't exist" >&2
> > +	exit 1
> > +fi
> > +
> > +dest_file="$dest_dir/index.rst"
> > +
> > +echo $title > "$dest_file"
> > +len=${#title}
> > +for i in $(seq 1 $len); do
> > +	echo -n "=" >> "$dest_file"
> > +done
> > +echo >> "$dest_file"
> > +echo >> "$dest_file"
> > +
> > +echo ".. toctree::" >> "$dest_file"
> > +echo "   :maxdepth: 1" >> "$dest_file"
> > +echo >> "$dest_file"
> > +
> > +for i in "${!args[@]}"; do
> > +	echo "   ${args[$i]}" >> "$dest_file"
> > +done
> > diff --git a/scripts/meson.build b/scripts/meson.build
> > index 342972e66078..ce12aa02e946 100644
> > --- a/scripts/meson.build
> > +++ b/scripts/meson.build
> > @@ -11,3 +11,6 @@ if build_tests
> >  		install_data(prog, install_dir : bindir, install_mode : 'r-xr-xr-x')
> >  	endforeach
> >  endif
> > +
> > +igt_doc_script = find_program('igt_doc.py')
> > +gen_rst_index = find_program('gen_rst_index')  
> 
