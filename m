Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C63C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 17:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470710FE8A;
	Wed, 27 Mar 2024 17:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mohlldmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71A10FE87
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 17:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711560115; x=1743096115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OeRpKays354T/MKHATQGt1+bxZKSVqf6RWuArqNFxdA=;
 b=mohlldmUvQQNV/lBuf3Y6JHgbA9IHwpqYv3tPvQWbgEwWbvv3o9j/+37
 MMrxXck4czI7iXI323wlasx/msYSqsXhdOtCCe55azJL0weXuXeyBbWic
 5/idsNgcsOStdLycBSqDds8c4GhQGieu4hwYoaeT1VXoDRYMyeRFM+pYV
 WrKs0Amv97ExPAHLqMXINjw6tp3CKv7lsyBCjqjRaLTiziarJNl9CXkeI
 9y6P7TITkBUel1Pxih6FgpvNhU8UdiM6xdtJVxNfq/s6V4swTkZRq4StV
 p9h2WtFL74Rmohd6XKNpv7IdwEbijAqP5fuE4orIcS7yKoBE3fy1bSeKP g==;
X-CSE-ConnectionGUID: nGV+VTkcTcG9/xw0BnsW7A==
X-CSE-MsgGUID: nTuTehjXQ1WpvSNdBpSe0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6868487"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6868487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 10:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="47572717"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:59:50 -0700
Date: Wed, 27 Mar 2024 17:59:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@gmail.com, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] Fix memory access issue due to variable block
 scope
Message-ID: <20240327165932.wnp332o5rcbnikyk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@gmail.com,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240325213548.2881-1-me@petersenna.com>
 <ZgK58ZwkJxhF6G6C@ashyti-mobl2.lan>
 <CA+MoWDpEpvpfbGEroLCCi=6dA+qeGu_i6h9VhYt3HMZyfzZ8Ug@mail.gmail.com>
 <20240326182006.xwloqd3ks4vsartq@kamilkon-desk.igk.intel.com>
 <CA+MoWDoKgm43ysBsN+Ta2KG6jSOKuLkznCVxobyfCVzrJKDRZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+MoWDoKgm43ysBsN+Ta2KG6jSOKuLkznCVxobyfCVzrJKDRZg@mail.gmail.com>
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

Hi Peter,

On 2024-03-26 at 22:41:27 +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for your email!
> 
> On Tue, Mar 26, 2024 at 7:20 PM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi peter.senna,
> > On 2024-03-26 at 14:18:43 +0100, Peter Senna Tschudin wrote:
> > > Hi Andi,
> > >
> > > Thank you for your reply.
> > >
> > > On Tue, Mar 26, 2024 at 1:05 PM Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > > >
> > > > Hey Peter,
> > > >
> > > > On Mon, Mar 25, 2024 at 10:35:48PM +0100, Peter Senna Tschudin wrote:
> > > > > This patch fixes the tests gem_exec_capture@many-4k-incremental and
> > > > > gem_exec_capture@many-4k-zero that are currently failing with an invalid file
> > > > > descriptor error.
> > > >
> > > > where is gem_exec_capture calling for_each_ctx_cfg_engine()?
> > >
> > > many(), userptr(), capture_invisible()
> > >     find_first_available_engine()
> > >         for_each_ctx_engine()
> > >
> > > When called by many(), 'e' gets corrupted when configure_hangs() tries
> > > to assign 'e' to another variable. Then after 'e' is corrupted, the
> > > call __captureN() will fail because it expects 'e' to be valid.
> > >
> >
> > imho first step whould be to replace macro with a function:
> >
> > saved = find_first_available_engine(fd, ctx, e);
> 
> When I was done with the replacement function, I found a simple
> solution that seems to be adequate. I made a small change to
> find_first_available_engine() to reassign e to an element of saved. My
> patch v3 has the details. What do you think?

I will reply to your v4 patch, it looks promising.

> 
> May I ask you to increase the time the CI will waits for the tests to complete:
>  - many-4k-zero: 2 minutes
>  - many-4k-incremental: 5 minutes (It takes 4 minutes on my N3150)

It is not posibble, sorry, as there are many of them and time adds up...

Regards,
Kamil

> 
> Thank you,
> 
> Peter
> 
> >
> > Regards,
> > Kamil
> >
> > > >
> > > > >  struct intel_execution_engine2 *
> > > > >  intel_get_current_engine(struct intel_engine_data *ed)
> > > > >
> > > > > When intel_get_current_engine is called from the macro
> > > > > for_each_ctx_cfg_engine(), the variable *ed is defined within a for loop. The
> > > > > scope of *ed is limited to that loop, leading to access violations when
> > > > > attempting to access its contents outside the loop.
> > > > >
> > > > > Before to this patch, intel_get_current_engine() would return an element of *ed
> > > > > and attempting to use it after the loop ended resulted in undefined behavior.
> > > > >
> > > > > This patch introduces a memcpy() to copy the contents of ed->current_engine to
> > > > > a memory area not confined by the loop's scope, ensuring safe access to the
> > > > > data.
> > > > >
> > > > > v2: Added 'i-g-t' to the Subject.
> > > > >
> > > > > Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> > > > > ---
> > > > >  lib/i915/gem_engine_topology.c | 14 +++++++++++++-
> > > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > > > > index afb576afb..b3b809482 100644
> > > > > --- a/lib/i915/gem_engine_topology.c
> > > > > +++ b/lib/i915/gem_engine_topology.c
> > > > > @@ -189,12 +189,24 @@ static int __query_engine_list(int fd, struct intel_engine_data *ed)
> > > > >  struct intel_execution_engine2 *
> > > > >  intel_get_current_engine(struct intel_engine_data *ed)
> > > > >  {
> > > > > +     struct intel_execution_engine2 *ret = NULL;
> > > > > +
> > > > >       if (ed->n >= ed->nengines)
> > > > >               ed->current_engine = NULL;
> > > > >       else if (!ed->n)
> > > > >               ed->current_engine = &ed->engines[0];
> > > > >
> > > > > -     return ed->current_engine;
> > > > > +     // When called from the macro for_each_ctx_cfg_engine(), *ed is defined
> > > > > +     // inside a for loop. In that case, not memcping ed->current_engine
> > > > > +     // will lead to a memory access violation when trying to access the
> > > > > +     // contents of ed->current_engine after the end of the for loop
> > > >
> > > > can you please use /* ... */ style of comment?
> > >
> > > sure, thank you for pointing this out.
> > >
> > > >
> > > > > +     if (ed->current_engine) {
> > > > > +             ret = malloc(sizeof(*ret));
> > > >
> > > > should this be freed at some point?
> > >
> > > I am not convinced that his patch is the best approach. If the problem
> > > is indeed the block scope of '*ed', I will propose to give
> > > for_each_ctx_engine() some serious love. I tried to come up with a
> > > proper solution but I failed to find one. The problems I faced are:
> > >  - for_each_ctx_engine() requires an struct intel_execution_engine2 as
> > > an iterator
> > >  - I did not find any way to keep for_each_ctx_engine() as a macro and
> > > change the scope(other than declaring ed outside the macro, argh...).
> > >  - Because for_each_ctx_engine() is a macro, I could not find a
> > > compiler friendly way to define the struct intel_execution_engine2
> > > within the macro
> > >  - To use free() 'properly', we need to save the information of when
> > > 'e' was allocated to prevent the code from trying to free something
> > > that should not be freed.
> > >
> > > This is why I asked for help here* on how you want me to fix it: I am
> > > under the impression that there is not a good solution for this
> > > problem. And then it becomes a question of long term maintenance.
> > > Should we drop the macro? Forbid the use of 'e' after the macro ends?
> > > Properly trace memory allocation of 'e' to prevent the potential
> > > free() issue? Something else? Please let me know.
> > >
> > > * - https://lists.freedesktop.org/archives/igt-dev/2024-March/070468.html
> > >
> > >
> > >
> > > >
> > > > Andi
