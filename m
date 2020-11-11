Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84889BF4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 11:00:05 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201111102226.GI7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <160502313035.11376.297659353090689661@emeril.freedesktop.org>
 <bb6f215c-e6d5-4628-dace-5179157b7c10@suse.de>
 <20201111102226.GI7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev]  =?unknown-8bit?b?4pyX?= Fi.CI.BAT: failure for Test cases for fbdev
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 11 Nov 2020 10:59:55 +0000
Message-ID: <160509239570.6304.13370240708007501194@build.alporthouse.com>
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
To: Petri Latvala <petri.latvala@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-11-11 10:22:26)
> On Wed, Nov 11, 2020 at 10:11:40AM +0100, Thomas Zimmermann wrote:
> > FYI, I replaced the mmap test with a set of more elaborate tests. It's
> > expected that mmap does not PASS any longer.
> > 
> > Is there a configuration file that I have to adapt?
> 
> Yeah, tests/intel-ci/fast-feedback.testlist. For getting this series
> fully tested, add a patch to the series that removes the line
> 
> igt@fbdev@mmap
> 
> from that file, with subjectprefix "CI" or "HAX" so it's clear it's
> not the final patch to be committed.
> 
> Chris, do you have any input as to which subtests we want to have in
> BAT in the end?

The read/write contents verification should work well for BAT; quick and
cover the simple use cases we know people do run into. Unaligned and
negative tests are better suited to full test run since they should not
provide any deep probes into the driver (and so not as likely to catch
unexpected bugs in future patches).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
