Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507DE6E3F5
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Apr 2020 11:22:36 +0000 (UTC)
Received: from localhost (unverified [78.156.65.138])
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20878611-1500050
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Apr 2020 12:22:34 +0100
MIME-Version: 1.0
In-Reply-To: <20200412112131.2752212-1-chris@chris-wilson.co.uk>
References: <20200412112131.2752212-1-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158669055246.23161.601857822888753570@build.alporthouse.com>
Date: Sun, 12 Apr 2020 12:22:32 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Restore premerge testing of
 heavy reloc testing
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
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-04-12 12:21:31)
> Kernel fixes are planned to bring these down to respectively duration.
> Validation of those fixes is required.

The other thing we could do is not apply this blacklist to trybot.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
