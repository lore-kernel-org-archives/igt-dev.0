Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9888F0A
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 05:43:27 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id q64so2241499qke.7
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 22:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191516.577394-13-jason@jlekstrand.net>
 <87a6ni8wxz.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87a6ni8wxz.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 23 Jun 2021 00:43:15 -0500
Message-ID: <CAOFGe94hnZYWASU7dAOKWXkhuZ+CizBBhjkB9jke+7GuhPRmBg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 62/79] tests/i915/gem_vm_create: Use
 intel_ctx_t in the execbuf test
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

On Mon, Jun 21, 2021 at 9:17 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Thu, 17 Jun 2021 12:14:59 -0700, Jason Ekstrand wrote:
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> What is the reason for this patch? If it is to avoid
> gem_context_set_param(), that is also being done in the isolation
> gem_vm_create test. In any case the patch is fine so:

We need to re-create the context every time we try with a new VM
anyway.  I guess I could have just sprinkled
gem_context_create/destroy around.  This didn't seem like a bigger
change.

--Jason

> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
