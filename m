Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB856E183
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2020 09:02:39 +0000 (UTC)
References: <20200916105932.908590-1-maarten.lankhorst@linux.intel.com>
 <160025447892.2193.17838748605576152008@build.alporthouse.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <32b0f997-274e-8d92-004f-38c0a239e737@linux.intel.com>
Date: Thu, 1 Oct 2020 11:02:34 +0200
MIME-Version: 1.0
In-Reply-To: <160025447892.2193.17838748605576152008@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_reloc: Cap max amount of
 active relocations in basic-many-active.
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Op 16-09-2020 om 13:07 schreef Chris Wilson:
> Quoting Maarten Lankhorst (2020-09-16 11:59:32)
>> Especially with -EDEADLK handling we can add relocations many times,
>> cap the amount of relocations tested, so that we still correctly
>> test that we can fill more than PAGE_SIZE / sizeof(relocation)
>> relocations.
> This is purposefully breaking the test. Again.
> -Chris

It's not breaking the test, the test would only pass if GPU relocation chaining was implemented.
This feature is removed, so we need an upper bound on the amount of relocations, or accept that
the test may fail if the ring is full. Either solution is fine, but the test itself is currently
broken.

~Maarten

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
