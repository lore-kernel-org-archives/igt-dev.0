Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8A6EE0D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 20:22:50 +0000 (UTC)
From: "Abodunrin, Akeem G" <akeem.g.abodunrin@intel.com>
Date: Thu, 20 Feb 2020 20:22:48 +0000
Message-ID: <CFEEE81102D91947B9CC368106979EBAC8A160B0@ORSMSX102.amr.corp.intel.com>
References: <20200218163540.12637-1-akeem.g.abodunrin@intel.com>
 <20200218163540.12637-2-akeem.g.abodunrin@intel.com>
 <20200219110610.GS25209@platvala-desk.ger.corp.intel.com>
 <CFEEE81102D91947B9CC368106979EBAC8A1549D@ORSMSX102.amr.corp.intel.com>
 <20200220101058.GX25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200220101058.GX25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tools/generate_cb_buffer: Add
 script to assemble CB kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Aran, Omer" <omer.aran@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Stewart,
 David C" <david.c.stewart@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pathi,
 Pragyansri" <pragyansri.pathi@intel.com>, "Bloomfield,
 Jon" <jon.bloomfield@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> On Thu, Feb 20, 2020 at 03:06:09AM +0200, Abodunrin, Akeem G wrote:
> > > > +export ASSEMBLY_SOURCE=./tools/assembly_source
> > > > +
> > > > +function get_help {
> > > > +        echo "Usage:    asm_eu_kernel.sh [options]"
> > > > +        echo "Remember to run this as root"
> > >
> > > I can't spot why this would need root.
> > Since we are generating new file, and writing to it - the script
> > definitely needs root access... otherwise commands like this "
> > prefix_header $i915_filename "Media CB Kernel for gen7.5 devices""
> > fails
> 
> That's no reason to need root. That's just a reason to need write access to the
> directory where you're creating the files.
> 
> As you require the script to be run in IGT source root and writing to $cwd, you
> need write access to IGT source root. Which shouldn't be root-owned.

I got you - but I don't think this is a big deal - I will remove it in the next spin... but not sure it adds any value at this point.
> 
> 
> > >
> > >
> > > > +        echo " "
> > > > +        echo "Please make sure your MESA tool is compiled, and
> > > > + run this script
> > > from igt home directory"
> > >
> > > Mesa written as "Mesa" and IGT written as "IGT". And it's "source
> > > root directory", not "home directory".
> > >
> > > Does the assembler require specific build options for Mesa? Note them here.
> >
> > Yes, it does - but the options are hardcoded in this script - so, mentioning them
> in the help function is irrelevant...
> 
> I'm asking about the Mesa _build_ options. This script doesn't build Mesa, it just
> uses it.
> 
> From a quick check that would be -Dtools=intel that is required.
I don't think Mesa requires Kernel build options to work, AFAIK - it is a standalone tool that could be installed in different ways as mentioned here "https://www.mesa3d.org/install.html" - So, no need for that information.

> 
> 
> 
> --
> Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
