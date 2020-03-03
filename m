Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816DC6EA22
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 08:54:00 +0000 (UTC)
Date: Tue, 3 Mar 2020 14:15:30 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200303084530.GG9735@intel.com>
References: <20200227084149.588-1-anshuman.gupta@intel.com>
 <874kvcryhp.fsf@intel.com> <20200303042733.GE9735@intel.com>
 <87wo81q1kx.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wo81q1kx.fsf@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t] LPSP igt test on TGL
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-03 at 10:34:06 +0200, Jani Nikula wrote:
> On Tue, 03 Mar 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > On 2020-02-27 at 14:44:18 +0200, Jani Nikula wrote:
> >> On Thu, 27 Feb 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> >> > Above block diagram depicts lpsp on TGL, while earlier development of
> >> > lpsp igt test it has been assumed that every non-edp panel is not a
> >> > lpsp panel but it is not true on TGL, any HDMI/DP panel connected on
> >> > pipe A and connected to PORT_{A,B,C} is lpsp panel, and DSI panel is
> >> > also lpsp panel.
> >> >
> >> > Currently i915_pm_lpsp igt has been categorized in edp-native and non-edp subtest.
> >> > non-edp subtest require the fix to validate the lpsp panels.
> >> > My solution approach to check the port on which DP/HDMI connector is currently 
> >> > connected.
> >> > if (port <= PORT_C)
> >> >     lpsp_should_be_enabled.
> >> > else
> >> >     lpsp_should_be_disabled.
> >> >  
> >> > Currently there are two igt i915_pm_lpsp, i915_pm_rpm require to know
> >> > the port of DP/HDMI connector, so we need a igt library function for
> >> > that.
> >> >
> >> > I am looking to parse the i915_display_info to get the port
> >> > information, but at same time it seems a fragile solution to me as any
> >> > change in i915_display_info will break the test, but i don't have any
> >> > other idea to get the port information.
> >> >
> >> > Please provide your opinion and feedback for the above solution approach.
> >> 
> >> I'd add a connector specific debugfs file that tells you whether LPSS
> >> (Low Power Single Pipe, for those who want to know what the acronym
> >> means) is possible and whether it's enabled. Alternatively add the info
> >> about LPSS to i915_display_info. But AFAICT there's no need for
> >> userspace to know about the port. This also avoids reading the
> >> HSW_PWR_WELL_CTL2 register directly.
> > Thanks Jani and Ville for your feedback and suggestion, based upon your feedback
> > i have following solution approach.
> > Add a connector specific debugfs attributes i915_lpsp_cpable.
> > for ecah connector if it is lpsp capable, do modeset with pipe A crtc 
> > on that connector and validate if power wells above  pg2 are turned off
> > by using i915_power_domain_info. 
> 
> Why not add a debugfs file that will tell you both, instead of forcing
> the userspace to know about the connection between lpsp and pg2?
IMHO a DP/HDMI connector may not be connected to pipe A crtc in default mode.
So via igt we can have modeset on Pipe A with DP/HDMI connector and can 
validate lpsp for DP/HDMI connector.
Please correct me if am wrong.
Thanks,
Anshuman Gupta.
> 
> BR,
> Jani.
> 
> 
> 
> >
> > Thanks ,
> > Anshuman
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> -- 
> >> Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
