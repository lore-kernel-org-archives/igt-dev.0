Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D4789B62
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2020 09:44:28 +0000 (UTC)
Date: Mon, 15 Jun 2020 12:44:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200615094426.GA20883@platvala-desk.ger.corp.intel.com>
References: <20200612085135.18375-1-petri.latvala@intel.com>
 <20200612085135.18375-2-petri.latvala@intel.com>
 <20200612085714.GT9497@platvala-desk.ger.corp.intel.com>
 <20200612125247.opjuffqvjs2tpwmu@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612125247.opjuffqvjs2tpwmu@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] gitlab-ci: Verify blacklist files
 with verify-blacklist.sh
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 03:52:47PM +0300, Arkadiusz Hiler wrote:
> On Fri, Jun 12, 2020 at 11:57:14AM +0300, Petri Latvala wrote:
> > On Fri, Jun 12, 2020 at 11:51:35AM +0300, Petri Latvala wrote:
> > > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > > Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > 
> > FYI: https://gitlab.freedesktop.org/adrinael/igt-gpu-tools/-/jobs/3073434
> > 
> > Verifying took 5 minutes on gitlab, but that's parallelized with the
> > other test-stage executions.
> 
> But it's also the slowest step of that stage by far. Even the qemu
> cross-testing is ~5x faster.
> 
> Doing:
> > if ! "$RUNNER" --list-all --include-tests "$test" "$BINDIR" >/dev/null 2>/dev/null; then
> for each blacklist entry is a bit expensive. It execs all the test
> binaries each time.
> 
> Something like this should be faster:
> 
> TESTLIST="$("$RUNNER" --list-all "$BINDIR")"
> 
> cat "$BLFILE" | while read line; do
>     blentry=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
>     if [ "$blentry" = "" ]; then continue; fi
> 
>     if ! (echo "$TESTLIST" | grep -q "$blentry") >/dev/null 2>/dev/null; then
>         echo Useless blacklist entry: "$blentry"
>        STATUS=1
>     fi
> done
> 
> This may be not exactly the same as runner is using glib's regex, but if
> you switch it to PCRE then 'grep -P' should be close enough.


Meh, fair enough. I was doing it this way to make sure we process the
blacklist exactly the same way in the check as in "production", and I
can't remember now what my real fear was. Extending the blacklist
syntax? We're going to catch that on first use on some level of
confidence and even if we don't it's not a big deal.

New revision with new numbers on its way!


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
