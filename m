Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AACC6EC66
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2020 10:29:19 +0000 (UTC)
Received: from localhost (unverified [78.156.65.138])
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21202221-1500050
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2020 11:29:15 +0100
MIME-Version: 1.0
In-Reply-To: <20200515071928.1173041-1-chris@chris-wilson.co.uk>
References: <20200515071928.1173041-1-chris@chris-wilson.co.uk>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158953855375.29850.3099084365960088492@build.alporthouse.com>
Date: Fri, 15 May 2020 11:29:13 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] kms_flip: Trim test durations for basic
 subtests [BAT]
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

Quoting Chris Wilson (2020-05-15 08:19:28)
> Reduce the target runtime for the individual subtests as each may be
> repeated multiple times accumulating a substantial fraction of the BAT
> runtime. A 100 flips or so should be as good an indicator of basic
> driver health as a few thousand, with the stress testing coming in the
> non-basic testing.

This knocks 50s off BAT runtime. Anyone care to ack?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
