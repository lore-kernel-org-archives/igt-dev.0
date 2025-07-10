Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA76C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 16:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D432010E231;
	Thu, 10 Jul 2025 16:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGyZfWwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD8710E231
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752164247; x=1783700247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NtjwDyUlm61/hFai5HGGLLKTtX0v3+/XP2480DzKAvU=;
 b=cGyZfWwTJ7d1T02qA/h/XCYzRfq8TsTw0+lYRruR1l7S5swPdUMAHsxO
 XUKfZeh4qGY3BEoxMmehwKaAIGRuZIv11pUA+3mRMxHb8S3FFlE3Dbord
 Y6nXAJLbVqvPaTat4zfAM2lKwW6DAF81QiTalvXp+aKK1Rqq9NG8m7kac
 OrW0WznGVxzk3uOseT1qYffZwi5b5WnNiqixpndrE8mE2vuZGqHt/er+t
 fCqxRCS94lEuXGcYG3JpN2H3Bufqv0Q3ImDdnKkt/KgZO1mACPuMcOzN0
 a69lAboQuylkjAdFzGKDxnH78ntiNx/9QlRFCsjyFKKsJVOIJ2WknYKi2 A==;
X-CSE-ConnectionGUID: W3C1FxsiQFGNT6bWBQrxqQ==
X-CSE-MsgGUID: AIG2qvIYSoyi2RvX092X4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54423009"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54423009"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 09:17:27 -0700
X-CSE-ConnectionGUID: rKnHjSOGSmSCmDD406UwjA==
X-CSE-MsgGUID: 0IFh2ER+TXq0VCcC8jAJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187120638"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 09:17:25 -0700
Date: Thu, 10 Jul 2025 18:17:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t 3/4] tests/amdgpu: Add test coverage for all
 user-mode queues across IP blocks
Message-ID: <20250710161707.jzkbcgkinoqk32eu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
 <20250708074819.624367-3-Jesse.Zhang@amd.com>
 <85tt3kk2o3.wl-ashutosh.dixit@intel.com>
 <3263d175-1f98-41ac-a46a-f446f54ba0e7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3263d175-1f98-41ac-a46a-f446f54ba0e7@amd.com>
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

Hi Vitaly,
On 2025-07-10 at 07:23:52 -0400, vitaly prosyak wrote:
> 
> On 2025-07-10 01:58, Dixit, Ashutosh wrote:
> > On Tue, 08 Jul 2025 00:47:49 -0700, Jesse.Zhang wrote:
> >> Introduced a new test function, amdgpu_test_all_queues(), to validate
> >> write-linear command submission across all available IP blocks (GFX, Compute, SDMA)
> >> with user-mode queues (UMQ).
> >>
> >> - Adds a dynamic subtest "all-queues-test-with-UMQ" under amdgpu_basic to ensure
> >>   all supported IP queues are exercised individually and in combination.
> >> - Uses the newly added helper amdgpu_command_submission_write_linear_helper2() to
> >>   manage setup, execution, and teardown across multiple IP types.
> >>
> >> This improves test coverage for command submission paths involving user queues
> >> and multi-IP coordination.
> >>
> >> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> >> ---
> >>  tests/amdgpu/amd_basic.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> >> index 8c6b466ce..100a634ce 100644
> >> --- a/tests/amdgpu/amd_basic.c
> >> +++ b/tests/amdgpu/amd_basic.c
> >> @@ -139,6 +139,14 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
> >> 	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
> >>  }
> >>
> >> +static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
> >> +{
> >> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX, false, user_queue);
> >> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_COMPUTE, false, user_queue);
> >> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_DMA, false, user_queue);
> >> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX |AMDGPU_HW_IP_COMPUTE |
> >> +							AMDGPU_HW_IP_DMA, false, user_queue);
> >> +}
> >>  /**
> >>   * SEMAPHORE
> >>   * @param device
> >> @@ -830,6 +838,16 @@ igt_main
> >> 			amdgpu_command_submission_sdma(device, true);
> >> 		}
> >> 	}
> >> +
> >> +	igt_describe("Check-all-user-queues-for-write-operation");
> >> +	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
> >> +		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
> >> +				userq_arr_cap[AMD_IP_COMPUTE] &&
> >> +				userq_arr_cap[AMD_IP_DMA]) {
> >> +			igt_dynamic_f("all-queues-with-umq")
> >> +			amdgpu_test_all_queues(device, true);
> >
> > Please clean up this warning without AMDGPU_USERQ_ENABLED:
> >
> > 636/1531] Compiling C object tests/amdgpu/amd_basic.p/amd_basic.c.o
> > ../tests/amdgpu/amd_basic.c:142:13: warning: ‘amdgpu_test_all_queues’ defined but not used [-Wunused-function]
> >   142 | static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
> >       |             ^~~~~~~~~~~~~~~~~~~~~~
> > [1526/1529] Generating docs/testplan/intel-ci-tests with a custom command
> 
> Thank you very much for the email. I’ll proceed with another patch today, as this one has already been merged.
> 
> Vitaly

I already proposed one but feel free to do it your way,
any solution is good.

Regards,
Kamil

> 
> >
> >
> >> +		}
> >> +	}
> >>  #endif
> >>
> >> 	igt_fixture {
> >> --
> >> 2.49.0
> >>
