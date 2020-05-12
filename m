Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
References: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158929987732.20930.7608676212881403390@build.alporthouse.com>
Date: Tue, 12 May 2020 17:11:17 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] lib/gem_test_engine: Add no
 device reopen variant
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-05-12 15:07:36)
> Some tests may need to take care of closing all device file descriptors
> even on subtest failure.  For example, if a test would like to
> effectively unload the driver module after a subtest failure, that
> wouldn't be possible if any device file descriptors were kept open.
> That may happen if the subtest wants to use gem_test_engine() helper as
> it reopens the device for its internal use and may certainly leave it
> open on failure.

I'm not completely satisfied with gem_test_engine(). The 'test' is
always better defined by the callers, as what is it testing exactly?

We can kill the i915_pm_rpm waste of time, which leaves gem_eio and that
is also dubious.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
