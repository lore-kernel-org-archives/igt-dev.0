Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007CE89CBC
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 16:24:44 +0000 (UTC)
Date: Wed, 3 Jun 2020 19:24:40 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200603162440.t6um7wezdx25zn4n@ahiler-desk1.fi.intel.com>
References: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
 <BL0PR11MB3028FFDDE4A2DE97349AD804EF880@BL0PR11MB3028.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL0PR11MB3028FFDDE4A2DE97349AD804EF880@BL0PR11MB3028.namprd11.prod.outlook.com>
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
To: "Hebenstreit, Michael" <michael.hebenstreit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Yang, Fei" <fei.yang@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On Wed, Jun 03, 2020 at 06:43:45PM +0300, Hebenstreit, Michael wrote:
> Confirmed the patch work - but leaves a question
> 
> Shouldn't this test case then report a fail as I do not allow all forks?
> 
> 10/293 lib: igt_fork                           OK       3.37 s

Thank's for the verification! I'll add 'Tested-by: you' when merging :-)

The test that was failing is subtest_leak.

It forks 4096/sizeof(pid_t) times and makes sure that we have killed all
the forked children successfully when exiting igt_subtest block, so we
don't leak any of them.

We don't manage to fork that exact number but that's fine, we fork as
many as the limits allows. I think this is much better behavior than
having this test fail on a more limited systems.

Please keep in mind that this is a "metatest" of the framework. There's
an assert inside igt_fork() which would cause any proper IGT test to
fail if we cannot fork() anymore.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
