Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BC56E046
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 09:57:02 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201111075210.GA7444@platvala-desk.ger.corp.intel.com>
References: <20201109151658.387207-1-chris@chris-wilson.co.uk>
 <20201111075210.GA7444@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 11 Nov 2020 09:56:55 +0000
Message-ID: <160508861522.29434.8692318441479983740@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Handle chamelium failures
 gracefully
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-11-11 07:52:10)
> On Mon, Nov 09, 2020 at 03:16:58PM +0000, Chris Wilson wrote:
> > Don't cause CI to abort a run if an _unrelated_ fixture checks for a
> > display and chamelium is dead.
> 
> If there's a chamelium configured and it's dead, we do want to abort
> though.

If there's no display, we don't run display tests. The GPUs are still
very interesting from my pov.
 
> What's an unrelated fixture in this context?

The fixture is after we have completed the subtest. So we get
	SUCCESS; ABORT
when we never intended to use the display at all.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
