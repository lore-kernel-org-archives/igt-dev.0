Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0015CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 10:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9810E49F;
	Mon, 22 Jun 2026 10:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbjxpzN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B731410E49F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782122988; x=1813658988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2kxb4srggJUzU0jwN1r8IrL5v3DaKNCp3bjX75l6QVg=;
 b=CbjxpzN1oqRiDM/ohkA5MbG1SfZesmfHgZiPVri0yDH6z+u6g/rxurUl
 cJFYZZgYjAQ0M2KpZZw/zcZkh904eK7ON1PCUUaUuoZCQR9OYjK69+0hC
 I8AZKwk3Igj0FG8jRZnjFdPPeFhK8UCbF+Ver2m2A8TieUIx8VkYbSn+5
 sxdc/Sq/kUQ7FnWwZaT9w5peVDJYtsnyQMLrjR0HBtiJKtLgrZpMDlhHV
 2UweRHi0sex0qqIOZTRo+Jex4j/+TKm1qPD/6VXii/ChFPVcjnVNx+8L0
 FqiS5T387gg5WVFu+NJf87rb0d2RgAIG7Lu2Y/AxMlznh9R3PZinKcw5/ Q==;
X-CSE-ConnectionGUID: EyDtL+DEQS+kMSaR0MiJ9w==
X-CSE-MsgGUID: 4RImS4naS8yf8eu0frFTGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82857636"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82857636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:09:48 -0700
X-CSE-ConnectionGUID: OWcXZO5xRYqDz7Q7xfScxA==
X-CSE-MsgGUID: 7KJDS5mfQuCFY/eiPo46wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="246866295"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:09:46 -0700
Date: Mon, 22 Jun 2026 12:09:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to
 multi-queue tests and subtests.
Message-ID: <20260622100943.btjphli2ijukrnrj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
 <20260617083549.1347431-6-priyanka.dandamudi@intel.com>
 <ajLYY_n7bLRFMqe4@nvishwa1-desk>
 <CH3PR11MB84344B2C4D5657E6FBBE4FE98DE22@CH3PR11MB8434.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH3PR11MB84344B2C4D5657E6FBBE4FE98DE22@CH3PR11MB8434.namprd11.prod.outlook.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Dandamudi,,
On 2026-06-19 at 05:35:03 +0000, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> > Sent: 17 June 2026 10:55 PM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to multi-
> > queue tests and subtests.
> > 
> > On Wed, Jun 17, 2026 at 02:05:52PM +0530, priyanka.dandamudi@intel.com
> > wrote:
> > >From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > >
> > >Add Mega feature and Sub-category fields to multi-queue tests and
> > subtests.
> > >
> > >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > >---
> > > tests/intel/xe_evict.c           | 72 ++++++++++++++++++++++------
> > > tests/intel/xe_exec_fault_mode.c | 81 ++++++++++++++++++++++----------
> > > tests/intel/xe_exec_reset.c      | 28 +++++++++++
> > > tests/intel/xe_exec_threads.c    | 44 ++++++++++-------
> > > 4 files changed, 167 insertions(+), 58 deletions(-)
> > >
> > >diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> > >82a6cde0a9..70cfa11bbb 100644
> > >--- a/tests/intel/xe_evict.c
> > >+++ b/tests/intel/xe_evict.c
> > >@@ -559,11 +559,7 @@ static unsigned int working_set(uint64_t
> > >vram_size, uint64_t system_size,
> > >  * arg[1]:
> > >  *
> > >  * @small:			small
> > >- * @small-multi-queue:		small multi queue
> > >- * @small-multi-queue-priority:
> > >- * 				small multi queue priority
> > >  * @small-external:		small external
> > >- * @small-external-multi-queue: small external multi queue
> > >  * @small-multi-vm:		small multi VM
> > >  * @beng-small:			small bind exec_queue
> > >  * @beng-small-external:	small external bind exec_queue
> > >@@ -593,12 +589,7 @@ static unsigned int working_set(uint64_t
> > >vram_size, uint64_t system_size,
> > >  * arg[1]:
> > >  *
> > >  * @small-cm:			small compute machine
> > >- * @small-multi-queue-cm:	small multi queue compute machine
> > >- * @small-multi-queue-priority-cm:
> > >- * 				small multi queue priority compute machine
> > >  * @small-external-cm:		small external compute machine
> > >- * @small-external-multi-queue-cm:
> > >- * 				small external compute machine multi queue
> > >  * @small-multi-vm-cm:		small multi VM compute machine
> > >  * @beng-small-cm:		small bind exec_queue compute machine
> > >  * @beng-small-external-cm:	small external bind exec_queue compute
> > machine
> > >@@ -629,8 +620,6 @@ static unsigned int working_set(uint64_t vram_size,
> > >uint64_t system_size,
> > >  * arg[1]:
> > >  *
> > >  * @mixed-threads-small:	mixed threads small
> > >- * @mixed-threads-small-multi-queue:
> > >- * 				mixed threads small multi queue
> > >  * @mixed-many-threads-small:	mixed many threads small
> > >  * @mixed-threads-small-multi-vm:
> > >  * 				mixed threads small multi vm
> > >@@ -668,8 +657,6 @@ static unsigned int working_set(uint64_t vram_size,
> > >uint64_t system_size,
> > >  *
> > >  * arg[1]:
> > >  * @cm-threads-small:		compute mode threads small
> > >- * @cm-threads-small-multi-queue:
> > >- * 				compute mode threads small multi queue
> > >  * @cm-threads-small-multi-vm:	compute mode threads small multi
> > vm
> > >  * @beng-cm-threads-small:	bind exec_queue compute mode threads
> > small
> > >  * @beng-cm-threads-small-multi-vm:
> > >@@ -700,7 +687,6 @@ static unsigned int working_set(uint64_t vram_size,
> > >uint64_t system_size,
> > >  *
> > >  * @threads-small:		threads small
> > >  * @beng-threads-small:		bind exec_queue threads small
> > >- * @threads-small-multi-queue:	threads small multi queue
> > >  * @threads-small-multi-vm:	threads small multi vm
> > >  * @beng-threads-small-multi-vm:
> > >  *				bind exec_queue threads small multi vm
> > >@@ -722,6 +708,64 @@ static unsigned int working_set(uint64_t vram_size,
> > uint64_t system_size,
> > >  * @beng-threads-large:		bind exec_queue threads large
> > >  *
> > >  */
> > >+/**
> > >+ * SUBTEST: evict-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description:  %arg[1] evict test.
> > >+ * Test category: functionality test
> > >+ *
> > >+ * arg[1]:
> > >+ *
> > >+ * @small-multi-queue:		small multi queue
> > >+ * @small-multi-queue-priority:	small multi queue priority
> > >+ * @small-external-multi-queue: small external multi queue
> > >+ *
> > >+ * SUBTEST: evict-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description:  %arg[1] evict test.
> > >+ * Feature: compute machine
> > >+ * Test category: functionality test
> > >+ *
> > >+ * arg[1]:
> > >+ *
> > >+ * @small-multi-queue-cm:	small multi queue compute machine
> > >+ * @small-multi-queue-priority-cm:	small multi queue priority compute
> > machine
> > >+ * @small-external-multi-queue-cm:	small external compute machine
> > multi queue
> > >+ *
> > >+ * SUBTEST: evict-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description:  %arg[1] evict test.
> > >+ * Feature: mixed threads
> > >+ * Test category: functionality test
> > >+ *
> > >+ * arg[1]:
> > >+ *
> > >+ * @mixed-threads-small-multi-queue:	mixed threads small multi
> > queue
> > >+ *
> > >+ * SUBTEST: evict-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description:  %arg[1] evict test.
> > >+ * Feature: compute mode threads
> > >+ * Test category: functionality test
> > >+ *
> > >+ * arg[1]:
> > >+ * @cm-threads-small-multi-queue:	compute mode threads small multi
> > queue
> > >+ *
> > >+ * SUBTEST: evict-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description:  %arg[1] evict test.
> > >+ * Feature: threads
> > >+ * Test category: functionality test
> > >+ *
> > >+ * arg[1]:
> > >+ *
> > >+ * @threads-small-multi-queue:	threads small multi queue
> > >+ */
> > >
> > > /*
> > >  * Table driven test that attempts to cover all possible scenarios of
> > >eviction diff --git a/tests/intel/xe_exec_fault_mode.c
> > >b/tests/intel/xe_exec_fault_mode.c
> > >index 3e92dfbd9a..23a1c31301 100644
> > >--- a/tests/intel/xe_exec_fault_mode.c
> > >+++ b/tests/intel/xe_exec_fault_mode.c
> > >@@ -78,14 +78,6 @@
> > >  *					bindexecqueue userptr invalidate
> > >  * @bindexecqueue-userptr-invalidate-race:
> > >  *					bindexecqueue userptr invalidate
> > race
> > >- * @multi-queue:			multi-queue
> > >- * @multi-queue-userptr:		multi-queue userptr
> > >- * @multi-queue-rebind:			multi-queue rebind
> > >- * @multi-queue-userptr-rebind:		multi-queue userptr rebind
> > >- * @multi-queue-userptr-invalidate:
> > >- *					multi-queue userptr invalidate
> > >- * @multi-queue-userptr-invalidate-race:
> > >- *					multi-queue userptr invalidate race
> > >  * @basic-imm:				basic imm
> > >  * @userptr-imm:			userptr imm
> > >  * @rebind-imm:				rebind imm
> > >@@ -101,15 +93,6 @@
> > >  *					bindexecqueue userptr invalidate
> > imm
> > >  * @bindexecqueue-userptr-invalidate-race-imm:
> > >  *					bindexecqueue userptr invalidate
> > race imm
> > >- * @multi-queue-imm:			multi-queue imm
> > >- * @multi-queue-userptr-imm:		multi-queue userptr imm
> > >- * @multi-queue-rebind-imm:		multi-queue rebind imm
> > >- * @multi-queue-userptr-rebind-imm:
> > >- *					multi-queue userptr rebind imm
> > >- * @multi-queue-userptr-invalidate-imm:
> > >- *					multi-queue userptr invalidate imm
> > >- * @multi-queue-userptr-invalidate-race-imm:
> > >- *					multi-queue userptr invalidate race
> > imm
> > >  * @basic-prefetch:			basic prefetch
> > >  * @userptr-prefetch:			userptr prefetch
> > >  * @rebind-prefetch:			rebind prefetch
> > >@@ -124,17 +107,63 @@
> > >  *					bindexecqueue userptr invalidate
> > prefetch
> > >  * @bindexecqueue-userptr-invalidate-race-prefetch:
> > >  *					bindexecqueue userptr invalidate
> > race prefetch
> > >- * @multi-queue-prefetch:		multi-queue prefetch
> > >- * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
> > >- * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
> > >- * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind
> > prefetch
> > >- * @multi-queue-userptr-invalidate-prefetch:
> > >- *					multi-queue userptr invalidate
> > prefetch
> > >- * @multi-queue-userptr-invalidate-race-prefetch:
> > >- *					multi-queue userptr invalidate race
> > prefetch
> > >  * @invalid-fault:			invalid fault
> > >  * @invalid-userptr-fault:		invalid userptr fault
> > >- * @multi-queue-invalid-fault:		multi-queue invalid fault
> > >+ */
> > >+/**
> > >+ * SUBTEST: once-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description: Run %arg[1] fault mode test only once
> > >+ * Test category: functionality test
> > >+ *
> > >+ * SUBTEST: twice-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description: Run %arg[1] fault mode test twice
> > >+ * Test category: functionality test
> > >+ *
> > >+ * SUBTEST: many-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description: Run %arg[1] fault mode test many times
> > >+ * Test category: stress test
> > >+ *
> > >+ * SUBTEST: many-execqueues-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description: Run %arg[1] fault mode test on many exec_queues
> > >+ * Test category: stress test
> > >+ *
> > >+ * arg[1]:
> > >+ *
> > >+ * @multi-queue:                        multi-queue
> > >+ * @multi-queue-userptr:                multi-queue userptr
> > >+ * @multi-queue-rebind:                 multi-queue rebind
> > >+ * @multi-queue-userptr-rebind:         multi-queue userptr rebind
> > >+ * @multi-queue-userptr-invalidate:
> > >+ *                                      multi-queue userptr invalidate
> > >+ * @multi-queue-userptr-invalidate-race:
> > >+ *                                      multi-queue userptr invalidate race
> > 
> > Here and elsewhere, may be we can add one more tab instead of going to
> > next line?

This is a code style present in other places, so imho
please keep it to be consistent across file.

> > Also, all tests start with 'multi-queue', may be include that in SUBEST tag as
> > now we have seprate definition for it (like SUBTEST: many-multi-queue-%s).
> > That will also reduce the test name length here. Same applies elsewhere
> > also.
> > 
> > Niranjana
> > 
> Tab I will add based on your suggestion but for the next suggestion to use SUBTEST: many-multi-queue-%s
> I need to create new struct 
> Below is the example which would be for all 
> +	static const struct section sections_mq[] = {
> +		{ "basic",				MULTI_QUEUE },
> +		{ "userptr",				MULTI_QUEUE | USERPTR },
> +		{ "rebind",				MULTI_QUEUE | REBIND },
> +		{ "userptr-rebind",			MULTI_QUEUE | USERPTR | REBIND },
> +		{ "userptr-invalidate",			MULTI_QUEUE | USERPTR | INVALIDATE },
> +		{ "userptr-invalidate-race",		MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> +		{ "imm",				IMMEDIATE | MULTI_QUEUE },
> +		{ "userptr-imm",			IMMEDIATE | MULTI_QUEUE | USERPTR },
> +		{ "rebind-imm",				IMMEDIATE | MULTI_QUEUE | REBIND },
> +		{ "userptr-rebind-imm",			IMMEDIATE | MULTI_QUEUE | USERPTR | REBIND },
> +		{ "userptr-invalidate-imm",		IMMEDIATE | MULTI_QUEUE | USERPTR | INVALIDATE },
> +		{ "userptr-invalidate-race-imm",	IMMEDIATE | MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> +		{ "prefetch",				PREFETCH | MULTI_QUEUE },
> +		{ "userptr-prefetch",			PREFETCH | MULTI_QUEUE | USERPTR },
> +		{ "rebind-prefetch",			PREFETCH | MULTI_QUEUE | REBIND },
> +		{ "userptr-rebind-prefetch",		PREFETCH | MULTI_QUEUE | USERPTR | REBIND },
> +		{ "userptr-invalidate-prefetch",	PREFETCH | MULTI_QUEUE | USERPTR | INVALIDATE },
> +		{ "userptr-invalidate-race-prefetch",	PREFETCH | MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
> +		{ "invalid-fault",			MULTI_QUEUE | INVALID_FAULT },
> +		{ "invalid-userptr-fault",		MULTI_QUEUE | INVALID_FAULT | USERPTR },
> +		{ NULL },
> +	}; 
> Add new loop
> +	for (const struct section *s = sections_mq; s->name; s++) {
> +		igt_subtest_f("once-multi-queue-%s", s->name)
> +			test_exec_main(fd, 1, 1, s->flags);
> +
> +		igt_subtest_f("twice-multi-queue-%s", s->name)
> +			test_exec_main(fd, 1, 2, s->flags);
> +
> +		igt_subtest_f("many-multi-queue-%s", s->name)
> +			test_exec_main(fd, 1,
> +					s->flags & (REBIND | INVALIDATE) ?
> +					64 : 128,
> +					s->flags);
> +
> +		igt_subtest_f("many-execqueues-multi-queue-%s", s->name)
> +			test_exec_main(fd, 16,
> +					s->flags & (REBIND | INVALIDATE) ?
> +					64 : 128,
> +					s->flags);
> +	} 
> After the above code addition/change we can change the documentation is it ok add new structs and loop? if so, will change all over.
> Please suggest.
> --Priyanka

Please do not make any code changes for now, start with rename
in comments only. Same applies to my previous review, if it is
too hard please start with your simple (and longer) change, rest
could be done later.

Regards,
Kamil

> /**
> + * SUBTEST: once-multi-queue-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: twice-multi-queue-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test twice
> + * Test category: functionality test
> + *
> + * SUBTEST: many-multi-queue-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test many times
> + * Test category: stress test
> + *
> + * SUBTEST: many-execqueues-multi-queue-%s
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
> + * Description: Run %arg[1] fault mode test on many exec_queues
> + * Test category: stress test
> + *
> + * arg[1]:
> + *
> + * @basic:				multi-queue
> + * @userptr:				multi-queue userptr
> + * @rebind:				multi-queue rebind
> + * @userptr-rebind:			multi-queue userptr rebind
> + * @userptr-invalidate:			multi-queue userptr invalidate
> + * @userptr-invalidate-race:		multi-queue userptr invalidate race
> + * @imm:				multi-queue imm
> + * @userptr-imm:			multi-queue userptr imm
> + * @rebind-imm:				multi-queue rebind imm
> + * @userptr-rebind-imm:			multi-queue userptr rebind imm
> + * @userptr-invalidate-imm:		multi-queue userptr invalidate imm
> + * @userptr-invalidate-race-imm:	multi-queue userptr invalidate race imm
> + * @prefetch:				multi-queue prefetch
> + * @userptr-prefetch:			multi-queue userptr prefetch
> + * @rebind-prefetch:			multi-queue rebind prefetch
> + * @userptr-rebind-prefetch:		multi-queue userptr rebind prefetch
> + * @userptr-invalidate-prefetch:	multi-queue userptr invalidate prefetch
> + * @userptr-invalidate-race-prefetch:	multi-queue userptr invalidate race prefetch
> + * @invalid-fault:			multi-queue invalid fault
> + * @invalid-userptr-fault:		multi-queue invalid userptr fault
> + */
> > >+ * @multi-queue-imm:                    multi-queue imm
> > >+ * @multi-queue-userptr-imm:            multi-queue userptr imm
> > >+ * @multi-queue-rebind-imm:             multi-queue rebind imm
> > >+ * @multi-queue-userptr-rebind-imm:
> > >+ *                                      multi-queue userptr rebind imm
> > >+ * @multi-queue-userptr-invalidate-imm:
> > >+ *                                      multi-queue userptr invalidate imm
> > >+ * @multi-queue-userptr-invalidate-race-imm:
> > >+ *                                      multi-queue userptr invalidate race imm
> > >+ * @multi-queue-prefetch:               multi-queue prefetch
> > >+ * @multi-queue-userptr-prefetch:       multi-queue userptr prefetch
> > >+ * @multi-queue-rebind-prefetch:        multi-queue rebind prefetch
> > >+ * @multi-queue-userptr-rebind-prefetch:
> > >+ *                                      multi-queue userptr rebind prefetch
> > >+ * @multi-queue-userptr-invalidate-prefetch:
> > >+ *                                      multi-queue userptr invalidate prefetch
> > >+ * @multi-queue-userptr-invalidate-race-prefetch:
> > >+ *                                      multi-queue userptr invalidate race prefetch
> > >+ * @multi-queue-invalid-fault:          multi-queue invalid fault
> > >  * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr
> > > fault  */
> > >
> > >diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > >index 9f5fde1a74..e41c663342 100644
> > >--- a/tests/intel/xe_exec_reset.c
> > >+++ b/tests/intel/xe_exec_reset.c
> > >@@ -350,9 +350,13 @@ test_balancer(int fd, int gt, int class, int
> > >n_exec_queues, int n_execs,
> > >  * Description: Test long spinners with many preemptable jobs, use
> > >queues again spinners complete on media GT
> > >  *
> > >  * SUBTEST: multi-queue-long-spin-many-queue-switch
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test long spinners with many jobs with multi-queue
> > > switching
> > >  *
> > >  * SUBTEST: multi-queue-long-spin-reuse-many-queue-switch
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test long spinners with many jobs with multi-queue
> > >switching, use queues again once spinners complete
> > >  *
> > >  * SUBTEST: gt-reset
> > >@@ -383,42 +387,66 @@ test_balancer(int fd, int gt, int class, int
> > >n_exec_queues, int n_execs,
> > >  * Description: Test compute mode close exec_queues close fd
> > >  *
> > >  * SUBTEST: multi-queue-cat-error
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test cat error with multi_queue
> > >  *
> > >  * SUBTEST: multi-queue-cat-error-on-secondary
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test cat error with multi_queue
> > >  *              on a secondary queue
> > >  *
> > >  * SUBTEST: multi-queue-gt-reset
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test GT reset with multi_queue
> > >  *
> > >  * SUBTEST: multi-queue-cancel
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test engine reset with multi_queue
> > >  *
> > >  * SUBTEST: multi-queue-cancel-on-secondary
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test engine reset with multi_queue
> > >  *              on a secondary queue
> > >  *
> > >  * SUBTEST: multi-queue-close-fd
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test close fd with multi_queue
> > >  *
> > >  * SUBTEST: multi-queue-close-execqueues
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test close execqueues with multi_queue
> > >  *
> > >  * SUBTEST: cm-multi-queue-cat-error
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test compute mode cat error with multi_queue
> > >  *
> > >  * SUBTEST: cm-multi-queue-cat-error-on-secondary
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test compute mode cat error with multi_queue
> > >  *              on a secondary queue
> > >  *
> > >  * SUBTEST: cm-multi-queue-gt-reset
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test compute mode GT reset with multi_queue
> > >  *
> > >  * SUBTEST: cm-multi-queue-close-fd
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test compute mode close fd with multi_queue
> > >  *
> > >  * SUBTEST: cm-multi-queue-close-execqueues
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >  * Description: Test compute mode close execqueues with multi_queue
> > > */
> > >
> > >diff --git a/tests/intel/xe_exec_threads.c
> > >b/tests/intel/xe_exec_threads.c index 2f44d5555d..894fa49bff 100644
> > >--- a/tests/intel/xe_exec_threads.c
> > >+++ b/tests/intel/xe_exec_threads.c
> > >@@ -1203,6 +1203,14 @@ static void *thread(void *data)
> > >  *	balancer mixed fd userptr invalidate
> > >  * @bal-mixed-fd-userptr-invalidate-race:
> > >  *	balancer mixed fd userptr invalidate race
> > >+ */
> > >+/**
> > >+ * SUBTEST: threads-%s
> > >+ * Mega feature: Multi-Queue
> > >+ * Sub-category: Multi-Queue tests
> > >+ * Description: Run threads %arg[1] test with multi threads
> > >+ *
> > >+ * arg[1]:
> > >  * @multi-queue-basic:
> > >  *	multi-queue basic
> > >  * @multi-queue-userptr:
> > >@@ -1244,49 +1252,49 @@ static void *thread(void *data)
> > >  * @multi-queue-fd-userptr-invalidate-race:
> > >  *	multi-queue fd userptr invalidate race
> > >  * @multi-queue-hang-basic:
> > >- *     multi-queue hang basic
> > >+ *	multi-queue hang basic
> > >  * @multi-queue-hang-fd-userptr-invalidate-race:
> > >  *	multi-queue hang fd userptr invalidate race
> > >  * @multi-queue-mixed-basic:
> > >  *	multi-queue mixed basic
> > >  * @multi-queue-mixed-userptr:
> > >- *	multi-queue-mixed userptr
> > >+ *	multi-queue mixed userptr
> > >  * @multi-queue-mixed-rebind:
> > >- *	multi-queue-mixed rebind
> > >+ *	multi-queue mixed rebind
> > >  * @multi-queue-mixed-userptr-rebind:
> > >- *	multi-queue-mixed userptr rebind
> > >+ *	multi-queue mixed userptr rebind
> > >  * @multi-queue-mixed-userptr-invalidate:
> > >- *	multi-queue-mixed userptr invalidate
> > >+ *	multi-queue mixed userptr invalidate
> > >  * @multi-queue-mixed-userptr-invalidate-race:
> > >- *	multi-queue-mixed userptr invalidate race
> > >+ *	multi-queue mixed userptr invalidate race
> > >  * @multi-queue-mixed-shared-vm-basic:
> > >  *	multi-queue mixed shared vm basic
> > >  * @multi-queue-mixed-shared-vm-userptr:
> > >- *	multi-queue-mixed shared vm userptr
> > >+ *	multi-queue mixed shared vm userptr
> > >  * @multi-queue-mixed-shared-vm-rebind:
> > >- *	multi-queue-mixed shared vm rebind
> > >+ *	multi-queue mixed shared vm rebind
> > >  * @multi-queue-mixed-shared-vm-userptr-rebind:
> > >- *	multi-queue-mixed shared vm userptr rebind
> > >+ *	multi-queue mixed shared vm userptr rebind
> > >  * @multi-queue-mixed-shared-vm-userptr-invalidate:
> > >- *	multi-queue-mixed shared vm userptr invalidate
> > >+ *	multi-queue mixed shared vm userptr invalidate
> > >  * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
> > >- *	multi-queue-mixed shared vm userptr invalidate race
> > >+ *	multi-queue mixed shared vm userptr invalidate race
> > >  * @multi-queue-mixed-fd-basic:
> > >  *	multi-queue mixed fd basic
> > >  * @multi-queue-mixed-fd-userptr:
> > >- *	multi-queue-mixed fd userptr
> > >+ *	multi-queue mixed fd userptr
> > >  * @multi-queue-mixed-fd-rebind:
> > >- *	multi-queue-mixed fd rebind
> > >+ *	multi-queue mixed fd rebind
> > >  * @multi-queue-mixed-fd-userptr-rebind:
> > >- *	multi-queue-mixed fd userptr rebind
> > >+ *	multi-queue mixed fd userptr rebind
> > >  * @multi-queue-mixed-fd-userptr-invalidate:
> > >- *	multi-queue-mixed fd userptr invalidate
> > >+ *	multi-queue mixed fd userptr invalidate
> > >  * @multi-queue-mixed-fd-userptr-invalidate-race:
> > >- *	multi-queue-mixed fd userptr invalidate race
> > >+ *	multi-queue mixed fd userptr invalidate race
> > >  * @multi-queue-cm-basic:
> > >- * 	multi-queue cm basic
> > >+ *	multi-queue cm basic
> > >  * @multi-queue-cm-fd-basic:
> > >- * 	multi-queue cm fd basic
> > >+ *	multi-queue cm fd basic
> > >  * @multi-queue-cm-userptr:
> > >  *	multi-queue compute mode userptr
> > >  * @multi-queue-cm-rebind:
> > >--
> > >2.43.0
> > >
