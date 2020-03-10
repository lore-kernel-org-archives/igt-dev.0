Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0889B9E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 17:11:23 +0000 (UTC)
From: "Hiatt, Don" <don.hiatt@intel.com>
Date: Tue, 10 Mar 2020 17:11:21 +0000
Message-ID: <97654A90DB924C44A3AE6C902A3FEAC15FA148E7@ORSMSX106.amr.corp.intel.com>
References: <20200310170928.109826-1-don.hiatt@intel.com>
 <158385962097.28297.12822720029591988949@build.alporthouse.com>
In-Reply-To: <158385962097.28297.12822720029591988949@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_pm: Adjust pm status check
 timeout and log timing
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> Quoting don.hiatt@intel.com (2020-03-10 17:09:28)
> > From: Don Hiatt <don.hiatt@intel.com>
> >
> > Increase the overall time we wait to achieve the desired runtime
> > status to 15 seconds to fix an occasional timeout and do so
> > in 1 second increments to speed up exiting. Also log the
> > amount of time we waited to get a handle on how much variation
> > we run into.
> 
> Ahem. But it is still an error, whereas this is now hiding severe
> failures.
> -Chris

Hi Chris,

I was hoping to get a handle on if the timeout was just borderline
around the 10 seconds and then try to figure out how to catch
just why the timeout even gets that high in the first place. Local
testing with the logging in this patch shows the vast majority
of the runs are 1 second timeouts, with an odd 2 or 3.

I can remove the 15 second increment and just keep the logging,
or just abandon the patch and work on a different approach?

Thanks for your comments!

don

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
