Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <1c364bddd1a951c03af51a84d2b106995fb18e5d.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 04 Dec 2020 13:20:47 +0100
In-Reply-To: <160708360801.1246.16281098489778669426@build.alporthouse.com>
References: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
 <160708360801.1246.16281098489778669426@build.alporthouse.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Don't kill a test on taint if
 watching timeouts
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-12-04 at 12:06 +0000, Chris Wilson wrote:
> Quoting Janusz Krzysztofik (2020-12-04 11:51:38)
> > We may still be interested in results of a test even if it has tainted
> > the kernel.  On the other hand, we need to kill the test on taint if no
> > other means of killing it on a jam is active.
> 
> Just so long as we are confident that the original error is preserved,
> and not lost under a deluge of what may come next. E.g. is there
> sufficient syncs after detecting the taint to record the kernel logs
> asap?
> 
> Although that the kernel taints is a strong indicator the test results
> are unreliable (or even irrelevant), imo.

Unless tainted with kernel warnings which result from bugs that can be
fixed, I believe.

Thanks,
Janusz

> -Chris

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
