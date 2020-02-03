Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509416EBDE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 12:03:19 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200203120103.GD25209@platvala-desk.ger.corp.intel.com>
References: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
 <20200203111344.GB25209@platvala-desk.ger.corp.intel.com>
 <158072891643.20090.13007450821769380286@skylake-alporthouse-com>
 <20200203115007.GC25209@platvala-desk.ger.corp.intel.com>
 <158073086877.20090.4222798174748260088@skylake-alporthouse-com>
 <20200203120103.GD25209@platvala-desk.ger.corp.intel.com>
Message-ID: <158073139485.20090.15306043084345097007@skylake-alporthouse-com>
Date: Mon, 03 Feb 2020 12:03:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Kill residual children at the end
 of a subtest
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

Quoting Petri Latvala (2020-02-03 12:01:03)
> Which test is that? All the tests I checked (a whopping two of them)
> follow the pattern of

gem_exec_balancer/bonded-slice, the background load gets trapped in an
infinite loop.
-Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
