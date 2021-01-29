Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4A46EAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jan 2021 11:04:12 +0000 (UTC)
References: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
 <20201215084825.101358-2-maarten.lankhorst@linux.intel.com>
 <160802282111.8745.912787390753427568@build.alporthouse.com>
 <161185595434.2943.13713875110960676997@build.alporthouse.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5a2ad95b-7cb1-6d9f-e991-48982548a88a@linux.intel.com>
Date: Fri, 29 Jan 2021 12:04:08 +0100
MIME-Version: 1.0
In-Reply-To: <161185595434.2943.13713875110960676997@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests: Do not use pread on userptr
 in gem_exec_parallel.
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

Op 28-01-2021 om 18:45 schreef Chris Wilson:
> Quoting Chris Wilson (2020-12-15 09:00:21)
>> Quoting Maarten Lankhorst (2020-12-15 08:48:25)
>>> It's even silly to use pread, directly read from the pointer instead by
>>> executing gem_wait first.
>> Major GEM violation.
> And you pushed this without recording the nack.
>
> In what way does breaking the ABI and pretending it never happened help?
> -Chris

Hey,

I don't see any explanation for the nack, just a generic statement that this breaks abi. If it was more specific, I could have added a full discussion to the commits.

I have manually verified that the code bases using the userptr abi didn't break, both by running the automated tests, and inspecting the code base. On top of that,

both Dave Airlie and Jason Ekstrand acked the changes to the kernel.

~Maarten

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
