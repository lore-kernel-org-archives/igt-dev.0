Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337A56E312
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 11:11:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200519094821.29150-1-petri.latvala@intel.com>
References: <20200519094821.29150-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158988665553.7442.2177236190966978512@build.alporthouse.com>
Date: Tue, 19 May 2020 12:10:55 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Don't use igt_fixture
 in an exit handler
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-05-19 10:48:21)
> kms_flip's exit handler was wrapped in an igt_fixture some 7 years ago
> because "it can fail". That's not a problem anymore, as igt_fail()
> will explicitly handle failing in an exit handler.
> 
> Rather, using igt_fixture in an exit handler is harmful because on a
> subtest failure, we don't always keep track of the currently running
> context (whether we're inside a subtest anymore) and we forcefully
> assert correct nesting of IGT magic control blocks now.
> 
> We already know the state is cleanable because we only install the
> handler on a successful init. Unconditional cleanup in an exit handler
> is the correct thing to do in general.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
