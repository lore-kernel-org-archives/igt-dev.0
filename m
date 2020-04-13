Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2AD89FA7
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2020 17:29:44 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Mon, 13 Apr 2020 17:29:40 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663FFFE202E@FMSMSX108.amr.corp.intel.com>
References: <20200413020509.678-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200413020509.678-1-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_shrink: Fix reversed logic when
 mmap fails
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>Ashutosh Dixit
>Sent: Sunday, April 12, 2020 10:05 PM
>To: igt-dev@lists.freedesktop.org
>Cc: Chris Wilson <chris@chris-wilson.co.uk>
>Subject: [igt-dev] [PATCH i-g-t] igt/gem_shrink: Fix reversed logic when mmap
>fails
>
>Can't touch the memory if mmap returns MAP_FAILED.
>
>Fixes: 9cff3be127("igt/gem_shrink: Reduce oom spam")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/i915/gem_shrink.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
>index 11aa9efc1..bb55a4a78 100644
>--- a/tests/i915/gem_shrink.c
>+++ b/tests/i915/gem_shrink.c
>@@ -274,7 +274,7 @@ static void leak(int fd, uint64_t alloc)
> 	ptr = mmap(NULL, alloc, PROT_READ | PROT_WRITE,
> 		   MAP_ANON | MAP_PRIVATE | MAP_POPULATE,
> 		   -1, 0);
>-	if (ptr != (char *)-1)
>+	if (ptr == (char *)-1)

AKA MAP_FAILED?

M


> 		return;
>
> 	while (alloc) {
>--
>2.26.0
>
>_______________________________________________
>igt-dev mailing list
>igt-dev@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
