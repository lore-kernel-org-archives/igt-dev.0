Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
References: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 06 Jan 2021 09:41:37 +0000
Message-ID: <160992609788.26089.16341465923272154441@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] runner: Don't kill a test on taint
 if watching timeouts
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
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-12-04 19:50:07)
> We may still be interested in results of a test even if it has tainted
> the kernel.  On the other hand, we need to kill the test on taint if no
> other means of killing it on a jam is active.
> 
> If abort on both kernel taint or a timeout is requested, decrease all
> potential timeouts significantly while the taint is detected instead of
> aborting immediately.  However, report the taint as the reason of the
> abort if a timeout decreased by the taint expires.

This has the nasty side effect of not stopping the test run after a
kernel taint. Instead the next test inherits the tainted condition from
the previous test and usually ends up being declared incomplete.

False positives are frustrating.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
