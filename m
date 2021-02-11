Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB616E5AE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 10:41:18 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Thu, 11 Feb 2021 10:41:09 +0000
Message-ID: <6f695047e9da4ce4a14d4bbcde49968d@intel.com>
References: <20210203100310.19441-1-anshuman.gupta@intel.com>
 <20210203100310.19441-2-anshuman.gupta@intel.com>
 <161235225893.6538.16121999594045383145@build.alporthouse.com>
In-Reply-To: <161235225893.6538.16121999594045383145@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Wednesday, February 3, 2021 5:08 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] i915/i915_pm_rpm: Enable PC8+
> residency test
> 
> Quoting Anshuman Gupta (2021-02-03 10:03:07)
> > Enabled pc8-residency test for each platform that supports pc8.
> > Bifurcate pc8-residency is display-on and display-off test case.
> >
> > Negative testing of PC8 residency on HASWELL/BROADWELL while display
> > being "on" is removed as it saves CI time and there is no ROI of such
> > testing.
> 
> Is checking for !pc8 in the atomic state checker? That would be a good, very
> precise, runtime debug check.
Could you please elaborate a little bit, I have not got much of this review comment.
> 
> Still a 30s timeout? Is that overly conservative? Is there some way to kick it into
> pc8 for fast tests with one or two slow let-it-enter-pc8-naturally tests?
From GFX side if it enters RC6 and display is off, 30 seconds is really conservative.
With RC6 it can reach PC2R and PC3 easily but for PC8 it also depends on other component as well.
That is why 30 second conservative time is safer to use. 

PC2R -> PC3
PC2R -> PC8
PC2R -> PC10
Transition from PC2R to deeper package C state are dependent upon entire system-wide negotiated LTR values.
 How about PC3 tests  in case we are looking for gem specific fast tests ?  
> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
