Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137610E190
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 06:41:25 +0000 (UTC)
Message-ID: <cdeb947b-6883-4245-a693-9463cd67669a@intel.com>
Date: Thu, 14 Dec 2023 12:11:04 +0530
Subject: Re: [PATCH v2 0/8] tests/kms_vrr: Modify kms_vrr to allow flicker
 profiling
Content-Language: en-US
To: Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
References: <20231023205910.3556533-1-sean@poorly.run>
 <CAOw6vbKBCHreAuaW0d3qB5hk4FcJZAqLSU6yOL=o_DwHtU_1Qw@mail.gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CAOw6vbKBCHreAuaW0d3qB5hk4FcJZAqLSU6yOL=o_DwHtU_1Qw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Sean Paul,

Are you planning to send a new rev, as we have few review comments?

FYI, I have merged few changes recently [*], you need to rebase this series.

[*]: https://patchwork.freedesktop.org/series/127047/

- Bhanu

On 14-11-2023 09:49 pm, Sean Paul wrote:
> Friendly review ping.
> 
> On Mon, Oct 23, 2023 at 4:59 PM Sean Paul <sean@poorly.run> wrote:
> 
>     From: Sean Paul <seanpaul@chromium.org <mailto:seanpaul@chromium.org>>
> 
>     Second revision of the set. New version addresses the review comments
>     from Bhanu and adds a new maxmin subtest which alternates the rate
>     between max and min every frame.
> 
>     Sean Paul (8):
>        tests/kms_vrr: Move fb0 and fb1 to an array
>        tests/kms_vrr: Move vtest_ns into data_t
>        tests/kms_vrr: Allow test rate to be altered from the command line
>        tests/kms_vrr: Allow test duration to be specified from the command
>          line
>        tests/kms_vrr: Change the pattern displayed in the test
>        tests/kms_vrr: Add ability to flip static image for flicker profiling
>        tests/kms_vrr: Allow for multiple rates in a test
>        tests/kms_vrr: Add a max/min test to oscillate between rates
> 
>       tests/kms_vrr.c | 213 +++++++++++++++++++++++++++++++++++-------------
>       1 file changed, 156 insertions(+), 57 deletions(-)
> 
>     -- 
>     Sean Paul, Software Engineer, Google / Chromium OS
> 
