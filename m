Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43888894
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 18:14:22 +0000 (UTC)
Received: from localhost (unverified [78.156.65.138])
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22942142-1500050
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Nov 2020 18:14:20 +0000
MIME-Version: 1.0
In-Reply-To: <20201109180359.444001-1-chris@chris-wilson.co.uk>
References: <20201109180359.444001-1-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 09 Nov 2020 18:14:18 +0000
Message-ID: <160494565896.21258.1505857972646004105@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Ignore runner's SIGQUIT from fork
 helpers
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
To: igt-dev@lists.freedesktop.org
Cc: 
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-11-09 18:03:59)
> We would rather not confuse our debug our without simultaneous delivery

s/our without/output with/

> of SIGQUIT to the helper processes, leaving the parent to handle SIGQUIT
> and kill the children. (If the parent is unable to quit, then it and the
> children will be killed by the runner.)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
