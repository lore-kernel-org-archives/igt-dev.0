Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F306EC44
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 16:20:41 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id n27so678770vsa.0
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 08:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219142445.69061-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 16:20:31 +0000
Message-ID: <CACvgo50-rSwCvWHh-q1X7K+JQY4n9oS4fcORPJjW6i-fn9hjxA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] ts/core_setmaster: new test for
 drop/set master semantics
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
To: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

HI all,

On Wed, 19 Feb 2020 at 14:24, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> From: Emil Velikov <emil.velikov@collabora.com>
>
> This test adds three distinct subtests:
>  - drop/set master as root
>  - drop/set master as non-root
>  - drop/set master for a shared fd
>
> Currently the second subtest will fail, with kernel patch to address
> that has been submitted.
>
> v2: Add to the autotools build
>
I've addressed the "igt_describe" issues, but will postpone v3 until
there's feedback on the patch.
Not a huge fan of spamming the CI ;-)

Aside: from a quick grep about 10% of the existing subtests have a
igt_describe section.
Guess we should bribe someone to address that, otherwise people are
bound to skip igt_describe all the time.

Thanks
Emil
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
