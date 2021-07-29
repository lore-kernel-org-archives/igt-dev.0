Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4D6ECC7
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 07:43:21 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so4988507ott.9
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 00:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <4ba5bb1e9fe08cbd9a6c43fc0e6e7eabc3d6520e.camel@redhat.com>
In-Reply-To: <4ba5bb1e9fe08cbd9a6c43fc0e6e7eabc3d6520e.camel@redhat.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 29 Jul 2021 09:43:09 +0200
Message-ID: <CAKMK7uH0_62jhrLkiz0ZynM1iwcdZ2nM2qWdDtu=mJB80nFjFw@mail.gmail.com>
Subject: Re: [igt-dev] Testing s2idle/S0?
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
To: Lyude Paul <lyude@redhat.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Porygon Solomon <jsolomon@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 10:06 PM Lyude Paul <lyude@redhat.com> wrote:
> Hi! Recently one of my coworkers from QA (cc'd here) asked me about whether we
> had any tests for s2idle in igt - to which I looked, didn't see anything that
> looked like a match, and suggested that they consider contributing some tests
> for it. Note that when I mention s2idle here, I'm thinking about systems which
> support both s2idle and S3 - as I know that s2idle is already being used by
> default for suspend/resume by igt on s2idle only systems.
>
> This made me realize that we don't actually have any explicit suspend/resume
> tests - we only have tests which handle testing other functionality across
> suspend/resume. This seems like it makes sense for the most part, which brings
> me to my real question here - would it be worth it to try adding s2idle
> support for most igt tests, so that on s2idle/S3 hybrid systems both suspend
> modes are tested individually for each suspend/resume test?

If you really add it to all of them the runtime explosion is likely
prohibitive. But a handful of explicit ones should be fine I guess.
-Daniel

> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
