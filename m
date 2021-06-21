Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21C089739
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 03:48:44 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id bm25so12070569qkb.0
 for <igt-dev@lists.freedesktop.org>; Sun, 20 Jun 2021 20:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-32-jason@jlekstrand.net>
 <20210618164714.629477-1-jason@jlekstrand.net>
 <87bl83dlq8.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87bl83dlq8.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Sun, 20 Jun 2021 22:48:32 -0500
Message-ID: <CAOFGe95LdZ76dB-QzycbPLHqB2DMW5t8W_XWg=ekg8Kp_gO-4w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_switch: Convert to
 intel_ctx_t
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 2:19 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Fri, 18 Jun 2021 09:47:14 -0700, Jason Ekstrand wrote:
> >
> > @@ -315,8 +326,8 @@ igt_main
> >       } phases[] = {
> >               { "", 0, NULL },
> >               { "-interruptible", INTERRUPTIBLE, NULL },
> > -             { "-queue", QUEUE, gem_has_queues },
> > -             { "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_queues },
> > +             { "-queue", QUEUE, gem_has_vm },
> > +             { "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_vm },
>
> As I was saying ealier I think here we should replace gem_has_vm with
> gem_has_queues() where:
>
> gem_has_queues == gem_has_vm && gem_context_has_single_timeline

Oh, I see what you mean now!  I've added this locally:

static bool
has_queues(int fd)
{
    return gem_has_vm(fd) && gem_context_has_single_timeline(fd);
}

and used it instead of gem_has_vm.  How's that sound?

--Jason

> But even otherwise this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
