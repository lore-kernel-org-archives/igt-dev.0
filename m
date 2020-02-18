Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBAF899E6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 11:26:06 +0000 (UTC)
Date: Tue, 18 Feb 2020 13:26:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200218112603.GP25209@platvala-desk.ger.corp.intel.com>
References: <20200217145042.829-1-petri.latvala@intel.com>
 <20200217145042.829-2-petri.latvala@intel.com>
 <158202145203.3043.6283843409560708384@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158202145203.3043.6283843409560708384@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] runner: Introduce per-test timeouts
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 10:24:12AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-02-17 14:50:42)
> > A new config option, --per-test-timeout, sets a time a single test
> > cannot exceed without getting itself killed. The time resets when
> > starting a subtest or a dynamic subtest, so an execution with
> > --per-test-timeout=20 can indeed go over 20 seconds a long as it
> > launches a dynamic subtest within that time.
> > 
> > As a bonus, verbose log level from runner now also prints dynamic
> > subtest begin/result.
> > 
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> 
> I wish igt had a pipe back to the runner so there was a clear protocol
> for this rather than trying to re-interpret the user output. (What's
> that you could pass commands from individual tests back to the runner,
> such as changing the dmesg filters, timeouts etc, etc)

Stop spying on my local branches.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
