Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9DBC369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 15:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C9510E26C;
	Mon, 21 Apr 2025 15:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mqpSE4KO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAC610E46B
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c48QOeXW8a255MvryAv6AFXNpp+HgvFWz7C+hSDMOlg=; b=mqpSE4KO87vhx57mEXRrQ6z/gC
 M+kN5bnyqHHYMMCZ+IM/4EmYkOYWDE6O0U7tI1r5Zj35AlmWU7O+qDC7proe7VbMAoAkng1X1+EAN
 hP8R5/udqtaXCK9RQ1uKhusmeYwJuj3x9WGX4VjGEuw007v9h3hPpGWjZ+RVqFHKja68M9Z2/xn1w
 Rb4gfwohq3DAIJtYBm5rPvfYFTB5NrucyXU+3/vEktWTxAOSJlL30P2z1L8MX/DLwerXExaDwxEJ7
 S9ah/ikgZ6Ps0zr6MX56BSSVc62CapQTLBhNHwxfyI/c5ddALfpenAqRP8giEvbfTXU9HBFbjmFWr
 h9dZADqA==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u6shn-0060ml-0D; Mon, 21 Apr 2025 17:05:07 +0200
Date: Mon, 21 Apr 2025 12:04:54 -0300
From: Melissa Wen <mwen@igalia.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Andre Almeida <andrealmeid@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, 
 Simon Ser <contact@emersion.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid
 driver-specific condition
Message-ID: <6c4ldbye7jjui25kofiv6itma6icf6xhouv7btnjuocmmbpsqb@kkvhwivs7nho>
References: <20250415200529.31722-1-mwen@igalia.com>
 <7177d94a-a2ca-4cb6-bbd8-894f489ac676@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7177d94a-a2ca-4cb6-bbd8-894f489ac676@intel.com>
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

On 04/17, Karthik B S wrote:
> Hi Melissa,
> 
> Although I agree that async flips can be rejected for multiple
> driver-specific reasons, my concern here is that there could potentially be
> a genuine failure(as EINVAL is a very generic failure check) as well which
> might get caught in this category and be treated as expected skip, whereas
> it ideally was something which should've been allowed by the driver.
> 
> IMHO, if we need to have this, we need to have some more checks together
> with EINVAL (though I'm not aware of what this could be currently) to treat
> it as a valid skip.

Hi Karthik,

Thanks for raising these points. I understand your concerns and I agree
that we should not ignore genuine failures, but I don't see a way to
currently get from the kernel a more accurate reason for async flip
failures.

Also, I don't think the current test implementation prevents misleading
skips even for i915 drivers. While the test attempts to meet all valid
conditions for i915 drivers, it allows the test to ignore the first flip
failure, which can be questionable when a driver advertises that it can
do async flip, but then the first flip fails (EINVAL) and we cannot
guarantee (control) that the cause is one or another unsupported
modifier or what else.

Unfortunately, cataloging all failure conditions and create a valid and
generic enough test configuration for all drivers in the subsystem
doesn't seem a feasible task.

So, if the current setup are suitable for validating i915 drivers, but
are not accurate for other drivers, an alternative may be limiting this
patch chane to AMD or any non-Intel device. WDYT?

Anyway, I can't think of anything better right now, but I'm open to
other suggestions that make the test cases valid for more vendors and
their hardware versions.

BR,

Melissa


> 
> Regards,
> Karthik.B.S
> On 4/16/2025 1:17 AM, Melissa Wen wrote:
> > Async page flips can fail for any driver-specific reasons, i.e. when the
> > driver can't commit to async page flip request for hw limitations, the
> > commit is rejected with -EINVAL since there is one or more conditions
> > that make the request invalid. These limitations varies between vendors
> > and hw versions. Skip a subtest if any invalid driver-specific condition
> > happens. This behavior is in line with userspace expectations and fits
> > better the plurality of drivers in the DRM subsystem.
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > 
> > ---
> > 
> > Hi,
> > 
> > Recent changes to async page flip conditions and limitations in the DRM
> > subsystem shed light on unexpected restrictions of async page flip
> > tests. The current approach doesn't make the test generic enough to
> > correctly deal with the diversity of reasons for a async page flip being
> > rejected by drivers of any HW vendor.
> > 
> > As an example, AMD display driver can't perform async flip when the
> > memory type changes [1][2][3]. After further investigation performed by
> > my colleague Thadeu Cascardo, he elucidated that this situation can
> > happen whenever there is not enough space for FBs in VRAM, so they are
> > allocated in GTT. Moreover, the space available in VRAM varies between
> > hw families and other system needs. Therefore, the driver rejects the
> > async flip due to memory type change, instead of silently downgrade the
> > page flip from async to sync - which seems correct.
> > 
> > The userspace expects the rejection (-EINVAL), but not the downgrade.
> > So, I understand the test_async_flip should just validate if async page
> > flips aren't downgrade in acceptable conditions and skip for any invalid
> > driver-specific condition.
> > 
> > [1] https://lore.kernel.org/amd-gfx/20230621202459.979661-2-andrealmeid@igalia.com/
> > [2] https://lore.kernel.org/amd-gfx/20230804182054.142988-1-hamza.mahfooz@amd.com/
> > [3] https://lore.kernel.org/amd-gfx/20250107152855.2953302-17-chiahsuan.chung@amd.com/
> > 
> > Let me know your thoughts!
> > 
> > Melissa
> > 
> > ---
> >   tests/kms_async_flips.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > index 031417ed8..0de299c2b 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -397,8 +397,10 @@ static void test_async_flip(data_t *data)
> >   		ret = perform_flip(data, frame, flags);
> > -		if (frame == 1 && data->allow_fail)
> > -			igt_skip_on(ret == -EINVAL);
> > +		if (data->allow_fail)
> > +			igt_skip_on_f(ret == -EINVAL,
> > +				      "Skipping, async flip not supported at frame %d " \
> > +				      "due to invalid driver-specific conditions.\n", frame);
> >   		else
> >   			igt_assert_eq(ret, 0);
> > @@ -768,7 +770,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
> >   			continue;
> >   		test_init(data);
> > -		data->allow_fail = false;
> > +		data->allow_fail = true;
> >   		data->modifier = default_modifier(data);
> >   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
> >   			/*
