Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088DB10E039
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 09:13:03 +0000 (UTC)
Message-ID: <17bd5bee-d5ff-9351-ed9b-e917b780d491@intel.com>
Date: Tue, 3 Oct 2023 14:42:43 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231001103006.431894-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add test for hotplug validation in
 simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

On Sun-01-10-2023 04:00 pm, Kunal Joshi wrote:
> Test to validate hotplug in simulation environment we
> have scratch pad register 0x4f080 from which we can
> trigger uevents such as HPD, VBLANK..etc, Idea is to
> have port mapping placed in igtrcthrough which test
> can write to 0x4f080 and check if we get hotplug

In first glance, do we really need to upstream this test? I am pretty 
sure, no one (including Intel) is going to use this test from upstream 
repo (We don't have any simulation environment in public CI).

So, we can't merge this.

+ Kamil, thoughts?

- Bhanu

> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> 
> Kunal Joshi (2):
>    tests/kms_simulation_hpd: New test for hotplug validation
>    tests/meson: added test to meson.build
> 
>   tests/intel/kms_simulation_hpd.c | 534 +++++++++++++++++++++++++++++++
>   tests/meson.build                |   1 +
>   2 files changed, 535 insertions(+)
>   create mode 100644 tests/intel/kms_simulation_hpd.c
> 
