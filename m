Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCE410E6D9
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 10:39:14 +0000 (UTC)
Date: Thu, 24 Nov 2022 12:39:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Message-ID: <Y39J5Gv3rmFz6b4j@platvala-desk.ger.corp.intel.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221115202101.278995-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] VC4 IGT Tests Updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 05:20:56PM -0300, Maíra Canal wrote:
> This series aims to update the VC4 IGT tests. The first three patches contain
> some janitorial duties related to the existing tests: creating a folder for the
> VC4 tests, removing some unused includes, and adding a macro with the default
> PAGE_SIZE. The fourth patch includes new tests for the VC4's performance
> monitors. Finally, the last patch adds an igt_require to all the VC4 tests to
> check that the tests are not running on BCM2711.
> 
> This series was tested on the Raspberry Pi 3 Model B and Raspberry Pi 4 Model B,
> and the HTML outputs of the VC4 tests are available on:
> 
> - Raspberry Pi 4: https://mairacanal.fedorapeople.org/igt-results/rpi4/html/
> - Raspberry Pi 3: https://mairacanal.fedorapeople.org/igt-results/rpi3/html/
> 
> Best Regards,
> - Maíra Canal
> 
> Maíra Canal (5):
>   tests/vc4: Move VC4 tests to their own folder
>   tests/vc4: Remove unused or redundant includes
>   lib/igt_vc4: Add PAGE_SIZE macro to VC4
>   tests/vc4_perfmon: Create test for VC4's Perfmon IOCTLs
>   tests/vc4: Skip VC4 tests if they are running on BCM2711/RaspberryPi4


Patches 1-3 are
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

I'm unable to fully review patches 4+5, for those
Acked-by: Petri Latvala <petri.latvala@intel.com>

Whether you want to have someone do a full review on the last two
patches before merging is up to you, let me know.
