Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211DE10E1CF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 19:11:45 +0000 (UTC)
Message-ID: <117968a6-8ccb-1283-ab82-6e6f9ef59dc0@intel.com>
Date: Thu, 7 Sep 2023 00:38:25 +0530
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20230825183934.1271156-1-sean@poorly.run>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230825183934.1271156-1-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 0/6] tests/kms_vrr: Modify kms_vrr to allow
 flicker
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sean Paul,

On Sat-26-08-2023 12:06 am, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Do some cleanup in the kms_vrr test and add some optional command line
> arguments to alter the target refresh rate for the test. This allows us
> to profile VRR flicker on panels at the low end of the refresh range.

Overall, this series makes sense to me. I have dropped few comments & my 
R-b too. But with this series, there is a crash in Negative test [1]. 
Please fix that.

And I can feel it is better to check the health of these kms_vrr tests 
by adding them to the BAT [2] & [3] with a HAX patch.

[1]: 
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9666/shard-mtlp-1/igt@kms_vrr@negative-basic@pipe-a-edp-1.html
[2]: tests/intel-ci/fast-feedback.testlist
[3]: tests/intel-ci/xe-fast-feedback.testlist

- Bhanu

> 
> Sean Paul (6):
>    tests/kms_vrr: Move fb0 and fb1 to an array
>    tests/kms_vrr: Move vtest_ns into data_t
>    tests/kms_vrr: Allow test rate to be altered from the command line
>    tests/kms_vrr: Allow test duration to be specified from the command
>      line
>    tests/kms_vrr: Change the pattern displayed in the test
>    test/kms_vrr: Add ability to flip static image for flicker profiling
> 
>   tests/kms_vrr.c | 138 ++++++++++++++++++++++++++++++++----------------
>   1 file changed, 92 insertions(+), 46 deletions(-)
> 
