Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6506EBEF
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 13:45:06 +0000 (UTC)
Date: Wed, 19 Feb 2020 15:45:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200219134503.GU25209@platvala-desk.ger.corp.intel.com>
References: <20200219121940.18247-1-petri.latvala@intel.com>
 <158211860207.8112.2166645472651306406@skylake-alporthouse-com>
 <20200219132758.GT25209@platvala-desk.ger.corp.intel.com>
 <158211919553.8112.12156633649709340297@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158211919553.8112.12156633649709340297@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner/resultgen: Provide output when
 test output is completely empty
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

On Wed, Feb 19, 2020 at 01:33:15PM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-02-19 13:27:58)
> > On Wed, Feb 19, 2020 at 01:23:22PM +0000, Chris Wilson wrote:
> > > Quoting Petri Latvala (2020-02-19 12:19:40)
> > > > If a machine is hard-hanging or otherwise rebooted at the correct
> > > > time, intermediary output files get created but nothing ever gets
> > > > written to them. That yields results that are completely empty and
> > > > hard to categorize or even sometimes detect automatically. Handle this
> > > > corner case explicitly with a custom text explaining what might have
> > > > happened to prod result analysis towards fixing the real issue instead
> > > > of wondering if test result processing is faulty.
> > > > 
> > > > The race for getting empty files is easier to hit than it seems. The
> > > > files get created by the runner before calling exec(), and there's
> > > > plenty of time to hit a really hard crash.
> > > 
> > > Speaking of which, it would not be terrible if igt_runner periodically
> > > called sync() everytime it decided there were new logs to preserve.
> > > We should also probably remove/reduce the writeback delay.
> > 
> > 
> > Does calling sync() sync more than fsyncdata()?
> 
> No manual entry for fsyncdata(), fdatasync()?
> sync/fsync includes metadata, fdatasync is just contents, unless
> metadata is required for data retrieval.
> 
> So for us, there really shouldn't be any difference between fdatasync
> and fsync (with the slight exception of last access timestamps).

Then what you're asking for is already there with --sync.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
