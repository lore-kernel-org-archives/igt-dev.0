Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F368A6EC6A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2020 10:35:58 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200515103222.GT9497@platvala-desk.ger.corp.intel.com>
References: <20200515071928.1173041-1-chris@chris-wilson.co.uk>
 <158953855375.29850.3099084365960088492@build.alporthouse.com>
 <20200515103222.GT9497@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158953895457.29850.9217925739317034988@build.alporthouse.com>
Date: Fri, 15 May 2020 11:35:54 +0100
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-05-15 11:32:22)
> On Fri, May 15, 2020 at 11:29:13AM +0100, Chris Wilson wrote:
> > Quoting Chris Wilson (2020-05-15 08:19:28)
> > > Reduce the target runtime for the individual subtests as each may be
> > > repeated multiple times accumulating a substantial fraction of the BAT
> > > runtime. A 100 flips or so should be as good an indicator of basic
> > > driver health as a few thousand, with the stress testing coming in the
> > > non-basic testing.
> > 
> > This knocks 50s off BAT runtime. Anyone care to ack?
> 
> 
> But where do we xkcd 303 then?

Still almost 13 minutes in just test runtime. Plenty of time for a
coffee and a couple of patches for that second coffee break.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
