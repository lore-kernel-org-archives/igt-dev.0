Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE8C89A92
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 16:30:09 +0000 (UTC)
From: "Hebenstreit, Michael" <michael.hebenstreit@intel.com>
Date: Wed, 3 Jun 2020 16:30:00 +0000
Message-ID: <BL0PR11MB30287FB71219B5976C0174B9EF880@BL0PR11MB3028.namprd11.prod.outlook.com>
References: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
 <BL0PR11MB3028FFDDE4A2DE97349AD804EF880@BL0PR11MB3028.namprd11.prod.outlook.com>
 <20200603162440.t6um7wezdx25zn4n@ahiler-desk1.fi.intel.com>
In-Reply-To: <20200603162440.t6um7wezdx25zn4n@ahiler-desk1.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Don't kill the world
 after a failed fork
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
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Yang, Fei" <fei.yang@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ok, thanks

-----Original Message-----
From: Hiler, Arkadiusz <arkadiusz.hiler@intel.com> 
Sent: Wednesday, June 03, 2020 10:25
To: Hebenstreit, Michael <michael.hebenstreit@intel.com>
Cc: igt-dev@lists.freedesktop.org; Yang, Fei <fei.yang@intel.com>; Latvala, Petri <petri.latvala@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Don't kill the world after a failed fork


On Wed, Jun 03, 2020 at 06:43:45PM +0300, Hebenstreit, Michael wrote:
> Confirmed the patch work - but leaves a question
> 
> Shouldn't this test case then report a fail as I do not allow all forks?
> 
> 10/293 lib: igt_fork                           OK       3.37 s

Thank's for the verification! I'll add 'Tested-by: you' when merging :-)

The test that was failing is subtest_leak.

It forks 4096/sizeof(pid_t) times and makes sure that we have killed all the forked children successfully when exiting igt_subtest block, so we don't leak any of them.

We don't manage to fork that exact number but that's fine, we fork as many as the limits allows. I think this is much better behavior than having this test fail on a more limited systems.

Please keep in mind that this is a "metatest" of the framework. There's an assert inside igt_fork() which would cause any proper IGT test to fail if we cannot fork() anymore.

--
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
