Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DB36EA59
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 11:37:42 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210203100310.19441-2-anshuman.gupta@intel.com>
References: <20210203100310.19441-1-anshuman.gupta@intel.com>
 <20210203100310.19441-2-anshuman.gupta@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Feb 2021 11:37:38 +0000
Message-ID: <161235225893.6538.16121999594045383145@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] i915/i915_pm_rpm: Enable PC8+
 residency test
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
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anshuman Gupta (2021-02-03 10:03:07)
> Enabled pc8-residency test for each platform that supports pc8.
> Bifurcate pc8-residency is display-on and display-off test case.
> 
> Negative testing of PC8 residency on HASWELL/BROADWELL while
> display being "on" is removed as it saves CI time and there is
> no ROI of such testing.

Is checking for !pc8 in the atomic state checker? That would be a good,
very precise, runtime debug check.

Still a 30s timeout? Is that overly conservative? Is there some way to
kick it into pc8 for fast tests with one or two slow
let-it-enter-pc8-naturally tests?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
