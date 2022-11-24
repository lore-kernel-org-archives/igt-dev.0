Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C603610E068
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 13:30:36 +0000 (UTC)
Message-ID: <45af4d0b-3d80-265b-3d07-ea6dfa70cf5b@igalia.com>
Date: Thu, 24 Nov 2022 10:29:13 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
 <Y39J5Gv3rmFz6b4j@platvala-desk.ger.corp.intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Y39J5Gv3rmFz6b4j@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/24/22 07:39, Petri Latvala wrote:
> On Tue, Nov 15, 2022 at 05:20:56PM -0300, Maíra Canal wrote:
>> This series aims to update the VC4 IGT tests. The first three patches contain
>> some janitorial duties related to the existing tests: creating a folder for the
>> VC4 tests, removing some unused includes, and adding a macro with the default
>> PAGE_SIZE. The fourth patch includes new tests for the VC4's performance
>> monitors. Finally, the last patch adds an igt_require to all the VC4 tests to
>> check that the tests are not running on BCM2711.
>>
>> This series was tested on the Raspberry Pi 3 Model B and Raspberry Pi 4 Model B,
>> and the HTML outputs of the VC4 tests are available on:
>>
>> - Raspberry Pi 4: https://mairacanal.fedorapeople.org/igt-results/rpi4/html/
>> - Raspberry Pi 3: https://mairacanal.fedorapeople.org/igt-results/rpi3/html/
>>
>> Best Regards,
>> - Maíra Canal
>>
>> Maíra Canal (5):
>>    tests/vc4: Move VC4 tests to their own folder
>>    tests/vc4: Remove unused or redundant includes
>>    lib/igt_vc4: Add PAGE_SIZE macro to VC4
>>    tests/vc4_perfmon: Create test for VC4's Perfmon IOCTLs
>>    tests/vc4: Skip VC4 tests if they are running on BCM2711/RaspberryPi4
> 
> 
> Patches 1-3 are
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> I'm unable to fully review patches 4+5, for those
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> Whether you want to have someone do a full review on the last two
> patches before merging is up to you, let me know.

Thanks for the review, Petri! I believe Melissa will review the last two 
patches soon.

Best Regards,
- Maíra Canal
