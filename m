Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAF489E2A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 11:46:18 +0000 (UTC)
Date: Thu, 27 Feb 2020 13:46:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200227114615.GK3839@platvala-desk.ger.corp.intel.com>
References: <20200220125207.16423-1-petri.latvala@intel.com>
 <20200220125207.16423-2-petri.latvala@intel.com>
 <cd539f54-df4c-a5f4-67b6-22c2b760bf70@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd539f54-df4c-a5f4-67b6-22c2b760bf70@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel-ci: Kernel selftest changes
 to fast-feedback and blacklist
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
To: Martin Peres <martin.peres@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 01:38:52PM +0200, Martin Peres wrote:
> On 2020-02-20 14:52, Petri Latvala wrote:
> > Now that selftest launchers are enumerable, we can control them with
> > fast-feedback.testlist and blacklist.txt. For now, apply the status
> > quo.
> 
> This patch series will end up being a no-op on Intel CI since we were
> appending the selftests as part of BAT testing. With this change done,
> CI will be able to drop this extra test list, and simplify execution.
> 
> I renamed the tests in cibuglog, so this patch series is:
> 
> Acked-by: Martin Peres <martin.peres@linux.intel.com>
> 
> And it is ready to merge from my PoV.

Merged, thanks.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
