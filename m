Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E26EA9A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Mar 2021 17:18:38 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ci14so47670327ejc.7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Mar 2021 09:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20210311100825.2518293-1-nroberts@igalia.com>
In-Reply-To: <20210311100825.2518293-1-nroberts@igalia.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 11 Mar 2021 09:18:25 -0800
Message-ID: <CADaigPWjogrzj8rp10t+-v=qFX4V7XQ12_4Pzrq56jXoB4VYgw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/vc4_dmabuf_poll: Fix checking for
 POLLOUT
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
To: Neil Roberts <nroberts@igalia.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 2:08 AM Neil Roberts <nroberts@igalia.com> wrote:
>
> This test has two subtests, one which polls for POLLIN on the dmabuf fd,
> and the other which looks like it's supposed to poll for POLLOUT. They
> are both implemented with a helper function that takes the polling flag
> as an argument. It looks like the helper actually ignores the argument
> and both subtests end up checking for POLLIN. This just fixes it to use
> the argument.

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
