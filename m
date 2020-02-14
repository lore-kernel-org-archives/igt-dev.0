Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643B6F92A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 13:26:40 +0000 (UTC)
From: "Nedunoori, Sravan Kumar" <sravan.kumar.nedunoori@intel.com>
Date: Fri, 14 Feb 2020 13:26:35 +0000
Message-ID: <D01393EA3B18E04A886C14D534415A2E7FAA97@BGSMSX107.gar.corp.intel.com>
References: <20200213045004.28209-1-sravan.kumar.nedunoori@intel.com>
 <158163508169.4660.12334684324098797527@skylake-alporthouse-com>
In-Reply-To: <158163508169.4660.12334684324098797527@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH][PATCH i-g-t]
 tests/i915/gem_write_read_ring_switch Removal of IGT Test
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>Given that outline, could we whip up a new pair of tests (implicit-read-fence, implicit-write-fence) for gem_exec_schedule?
[Sravan] : Sure, will enhance the gem_exec_schedule with the Implicit-read/write-fence subtests. 

Can we go ahead with the change/patch(gem_write_read_ring_switch) 

-Sravan Kumar Nedunoori 

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Friday, February 14, 2020 4:35 AM
To: igt-dev@lists.freedesktop.org; Nedunoori, Sravan Kumar <sravan.kumar.nedunoori@intel.com>
Subject: Re: [igt-dev] [PATCH][PATCH i-g-t] tests/i915/gem_write_read_ring_switch Removal of IGT Test

Quoting Sravan Kumar Nedunoori (2020-02-13 04:50:04)
> Removal of this test, as it checks read/write syncpoints when 
> switching rings and doesn't add anything to other tests.

write/read sync. Ah, I was thinking about read/read and the only thing that came to mind as proving that would be the gem_busy/extended

Ok, this is covered by the gem_exec_whisper brute, but do we have a simple and clear test to show that writes are blocked by a reader?

for_each_physical_engine(writer)
	dep = gem_create(4096);
	for_each_physical_engine(reader) {
		if (reader == write)
			continue;
		/* XXX with a few tweaks write a secret breadcrumb */
		igt_spin_new(reader, .read = dep);
	}
	breadcrumb(write, dep); /* implicit fence -> queued after readers */
	gem_quiescent_gpu(); /* cancels all spinners */
	igt_assert_eq(breadcrumb == writers);
}
/* This can be reversed to test write->reader implicit fences */

that feels very, very much like a test we have somewhere. But I couldn't put my finger on which one.

Given that outline, could we whip up a new pair of tests (implicit-read-fence, implicit-write-fence) for gem_exec_schedule?

-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
