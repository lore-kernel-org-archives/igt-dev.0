Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C0010E1B4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 05:54:18 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 82553580583
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 22:54:17 -0700 (PDT)
Message-ID: <35d1edaa-e657-7e95-0c23-ee138856beb7@linux.intel.com>
Date: Fri, 26 May 2023 07:54:14 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-12-mauro.chehab@linux.intel.com>
 <20230525211144.snixsj3tbhkypi4a@kamilkon-desk1>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230525211144.snixsj3tbhkypi4a@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 11/11] testplan/meson.build: make it
 check for missing i915 documentation
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


On 5/25/23 23:11, Kamil Konieczny wrote:
> Hi Mauro,
>
> On 2023-05-25 at 11:05:35 +0200, Mauro Carvalho Chehab wrote:
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> Now that i915 is fully documented, check it at build time.
> This is not working now, see GitLab log:
>
> Warning: Missing documentation for igt@perf_pmu@rc6-all-gts
> ninja: build stopped: subcommand failed.
>
> Can we not turn it on until we fill in all gaps ?
>
> Regards,
> Kamil

Sure. I'll drop it when merging it. We can add this later on.

Regards,
Mauro
