Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589416E977
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 10:44:36 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200303084530.GG9735@intel.com>
References: <20200227084149.588-1-anshuman.gupta@intel.com>
 <874kvcryhp.fsf@intel.com> <20200303042733.GE9735@intel.com>
 <87wo81q1kx.fsf@intel.com> <20200303084530.GG9735@intel.com>
Date: Tue, 03 Mar 2020 12:44:30 +0200
Message-ID: <87lfohpvjl.fsf@intel.com>
MIME-Version: 1.0
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 03 Mar 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> On 2020-03-03 at 10:34:06 +0200, Jani Nikula wrote:
>> On Tue, 03 Mar 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>> > On 2020-02-27 at 14:44:18 +0200, Jani Nikula wrote:
>> >> On Thu, 27 Feb 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>> > Add a connector specific debugfs attributes i915_lpsp_cpable.
>> > for ecah connector if it is lpsp capable, do modeset with pipe A crtc 
>> > on that connector and validate if power wells above  pg2 are turned off
>> > by using i915_power_domain_info. 
>> 
>> Why not add a debugfs file that will tell you both, instead of forcing
>> the userspace to know about the connection between lpsp and pg2?
> IMHO a DP/HDMI connector may not be connected to pipe A crtc in default mode.

What is default mode?

> So via igt we can have modeset on Pipe A with DP/HDMI connector and can 
> validate lpsp for DP/HDMI connector.
> Please correct me if am wrong.

Sorry, I am not sure what you're asking.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
