Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477FA10E785
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 11:01:32 +0000 (UTC)
Date: Fri, 1 Sep 2023 13:01:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ilja Friedel <ihf@google.com>
Message-ID: <20230901130127.762d6a6f@maurocar-mobl2>
In-Reply-To: <20230901094540.564ce3f6@maurocar-mobl2>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-5-mauro.chehab@linux.intel.com>
 <20230710181709.234ki5ihaoh6cj5l@kamilkon-desk1>
 <CAJUqKUo9rKSqQ6h17gbiEWVhQSaAsvwD51_fmpBr+MTm_R7Rug@mail.gmail.com>
 <CAAea8Y3a_RjknGcn6-v9CVUVpcmMuASnJKfn73KGtQzbXo0TcA@mail.gmail.com>
 <20230831112851.2b5c19b7@maurocar-mobl2>
 <CAAea8Y13=CguTipLJjJJt_pBvaiv92DViWJBZwvtjm7W-SU+vw@mail.gmail.com>
 <20230901094540.564ce3f6@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/7] tests/meson.build: create
 testlists for tests
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

On Fri, 1 Sep 2023 09:45:40 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> > > Could you please check if this will address the issue? I don't have
> > > a cross-compilation environment handy to test it, so it would be
> > > easier if you could test it for me.
> > >    
> > 
> > The enclosed patch "[PATCH i-g-t] tests/meson.build: only generate
> > testlists
> > on native builds" works for our build system. If you want to stick with it,
> > could you please land it in the upstream tree?   
> 
> I sent the patch upstream too. Had to do a rebase today due to
> a conflict (that actually made the final patch simpler):
> 
> 	https://patchwork.freedesktop.org/series/123104/
> 
> Could you please re-test and review or ack it? I'll merge it after
> getting your R-B or A-B.

As this is a compilation breakage affecting you, and I got already
a reviewed-by for this patch, I'll go ahead and apply it. It should
hopefully address your issue.

Still, if it doesn't solve and/or you have a better solution, feel
free to send a followup patch.

Regards,
Mauro
