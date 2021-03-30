Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C17D6E881
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Mar 2021 09:00:44 +0000 (UTC)
References: <DM6PR11MB2796AC0127DAAF10BF61915C917E9@DM6PR11MB2796.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <bbba8b25-7e29-d0e1-34bc-555ebabdfc3e@linux.intel.com>
Date: Tue, 30 Mar 2021 10:00:38 +0100
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB2796AC0127DAAF10BF61915C917E9@DM6PR11MB2796.namprd11.prod.outlook.com>
Content-Language: en-US
Subject: Re: [igt-dev] IGT on SLES
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vemasani, Vinod" <vinod.vemasani@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Dewitt, David J" <david.j.dewitt@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Musta, Tom" <tom.musta@intel.com>, "Lovin, Brian J" <brian.j.lovin@intel.com>, "Nguyen, Anthony D" <anthony.d.nguyen@intel.com>, "Kumar,
 Manish3" <manish3.kumar@intel.com>, "Sharp,
 Amanda K" <amanda.k.sharp@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/03/2021 00:10, Vemasani, Vinod wrote:
> Hello,
> 
> I am trying to get intel-gpu-tools installed on SLES machine(s). The 
> README has instructions for Fedora/Debian and none for SLES. I reached 
> out to couple of contacts and they told me it has a dependency which is 
> difficult to meet for SLES. Is it true? Has anyone built on SLES 
> successfully?

Haven't tried but it would be a serious fail if anything was distro 
specific. Probably it is just a matter of installing correct 
development/header packages. Please share more details of the problem.

> Came across this package for SUSE - 
> https://software.opensuse.org/download/package?package=intel-gpu-tools&project=openSUSE%3ALeap%3A15.2 
> <https://software.opensuse.org/download/package?package=intel-gpu-tools&project=openSUSE%3ALeap%3A15.2> 
> 
> 
> Installed RPM successfully but ran into this :
> 
> *//home/vvemasan/intel_gpu_top/*
> 
> */Failed to detect engines! (No such file or directory)/*
> 
> */(Kernel 4.16 or newer is required for i915 PMU support.) /*
> 
> Any tips/thoughts/suggestions are appreciated.

According to the link this contains a package called 
intel-gpu-tools-1.23-lp1152.2.9.src.rpm. Version 1.23 was released in 
2018 and there definitely were a bunch of fixes since. So you definitely 
want something newer. At least 1.25 but ideally git master.

Just in case two questions:

1)
Obviously your kernel is newer than 4.16? :)

2)
Please paste:
  * Output from lspci
  * ls -ld /sys/devices/i915*/events/
  * ls -l /sys/devices/i915*/events/

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
