Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80CA10E0D8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 10:20:17 +0000 (UTC)
Date: Thu, 13 Jul 2023 12:20:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230713102013.abkuidiwsmvhimtx@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-7-mauro.chehab@linux.intel.com>
 <20230712183859.bafpcr4ylxinjktg@kamilkon-desk1>
 <20230713074715.15b784e3@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230713074715.15b784e3@maurocar-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v2 06/13] scripts/test_list.py: close
 config file before start processing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-07-13 at 07:47:15 +0200, Mauro Carvalho Chehab wrote:
> On Wed, 12 Jul 2023 20:38:59 +0200
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > Hi Mauro,
> > 
> > On 2023-07-12 at 15:58:47 +0200, Mauro Carvalho Chehab wrote:
> > > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > 
> > > Reduce the identation level of the code which parses the config
> > > file, as this can be done after closing the file.  
> > ----- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Where it is? Maybe should be dropped?
> > 
> > > 
> > > This is a preparation for the next patch that will offer a different
> > > way to pass the configuration.  
> > 
> > Could you change description? Now it is a little confusing,
> > you only change indentation but it state:
> > 
> > v2 06/13 scripts/test_list.py: close config file before start processing
> > ------------------------------ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Maybe something like: change indentation of code
> 
> I opted to describe the functional change, and not the physical one.
> 
> This is something I don't like on python: changing indentation actuall
> changes the code itself, as it doesn't have explicit block markups like
> C's { } or Pascal's begin ... end. 
> 
> What was happening before was equivalent to this (in C code format):
> 
> 	fp = fopen(...)
> 	if (!fp) exit();	// implicit, as this is python normal behavior
> 	{
> 		fread()
> 		// do a lot of things (unrelated to fp itself)
> 	}
> 	fclose(fp)
> 
> After the change, the code is it now:
> 
> 	fp = fopen(...)
> 	if (!fp) exit();
> 	fread()
> 	fclose(fp)
> 	// do a lot of things
> 	
> Yeah, as a side effect, we have one less level of indentation, which is
> indeed a good thing.
> 
> Regards,
> Mauro

Thank you for explanation, I missed this in those massive un-indentation.

Regards,
Kamil


