Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A761C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 13:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1610E9EC;
	Fri, 14 Mar 2025 13:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3EZvP3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3C10E9EC
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741957737; x=1773493737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=h57lNi1wLuZAHQEeEkTHxEv4zJuUE94xm0oX0VNact0=;
 b=N3EZvP3qkRQepX9aSXUYWHJlVEH/FnhdZyFjTNSElO6NkAbVnh05t0HR
 JGqS1klPwO/zvfncCU/XR9nU68jnAyVm/J+1ltQ1Sw3R39kHcV7c5Tkgd
 wFPeKfD37bOx1U3aWCmAxPD8kAVLh6Ha8RMN5Ok0pcMa3ajfwL/4pvTQ6
 KyDTR+J6qKB3VQWku7+WimloiDnyluSfow869oHRCFkdnAYf2n7mMVYz7
 czwjnBFAHDHOsCK/zsFGkqSl0mqN3nQ91itS7tvfeLvHoJfCtm905mH0g
 IclUtYIvJSzz9pSYDNcnVoofA82kgAAFWLu03FqaIBIvAr4Wyy4A5B0bH w==;
X-CSE-ConnectionGUID: Uqgp4ERDQM2hmq9ouvk4pw==
X-CSE-MsgGUID: 5U+Z9uMTRFWtWefdfnfexA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60647709"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60647709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:08:56 -0700
X-CSE-ConnectionGUID: KPigRvEdS++yRcVUWcOE4w==
X-CSE-MsgGUID: pHEjzMYCRO6UiNaahgRgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126489942"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 14 Mar 2025 06:08:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Mar 2025 15:08:53 +0200
Date: Fri, 14 Mar 2025 15:08:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
Message-ID: <Z9QqZTuTZKiK_4CJ@intel.com>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
 <Z699roJnvD0kO4Ne@intel.com>
 <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
 <Z6-v-I4F2Os8vXCa@intel.com>
 <0b46c164-bc94-46ce-a6be-50c18d95a718@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b46c164-bc94-46ce-a6be-50c18d95a718@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Mar 14, 2025 at 06:04:07PM +0530, Sharma, Swati2 wrote:
> Hi Ville,
> 
> On 15-02-2025 02:34 am, Ville Syrjälä wrote:
> > On Fri, Feb 14, 2025 at 11:56:27PM +0530, Sharma, Swati2 wrote:
> >> Hi Ville,
> >>
> >> On 14-02-2025 11:00 pm, Ville Syrjälä wrote:
> >>> On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
> >>>> This tests is currently disabled since CRC computed on Intel
> >>>> hardware seems to include data on the lower bits, this is
> >>>> preventing us to CRC checks.
> >>>>
> >>>> Let's try to enable it back and check behavior on newer Intel
> >>>> platforms.
> >>>>
> >>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> >>>> ---
> >>>>    tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
> >>>>    1 file changed, 93 insertions(+), 73 deletions(-)
> >>>>
> >>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
> >>>> index 4b71d3dd3..c3b285b4e 100644
> >>>> --- a/tests/kms_color.c
> >>>> +++ b/tests/kms_color.c
> >>>> @@ -58,6 +58,7 @@
> >>>>     * @0-75:           for 0.75 transparency
> >>>>     * @blue-to-red:    from blue to red
> >>>>     * @green-to-red:   from green to red
> >>>> + * @limited-range:  with identity matrix
> >>>>     * @max:            for maximum transparency
> >>>>     * @negative:       for negative transparency
> >>>>     * @red-to-blue:    from red to blue
> >>>> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
> >>>>     * This test is currently disabled as the CRC computed on Intel hardware seems
> >>>>     * to include data on the lower bits, this is preventing us to CRC checks.
> >>>>     */
> >>>> -#if 0
> >>>> -static void test_pipe_limited_range_ctm(data_t *data,
> >>>> +static bool test_pipe_limited_range_ctm(data_t *data,
> >>>>    					igt_plane_t *primary)
> >>>>    {
> >>>>    	double limited_result = 235.0 / 255.0;
> >>>> -	static const color_t red_green_blue_limited[] = {
> >>>> +	color_t red_green_blue_limited[] = {
> >>>>    		{ limited_result, 0.0, 0.0 },
> >>>>    		{ 0.0, limited_result, 0.0 },
> >>>> -		{ 0.0, 0.0, limited_result },
> >>>> +		{ 0.0, 0.0, limited_result }
> >>>>    	};
> >>> This whole thing is fundementally broken. We can't generate
> >>> limited range output without using the CSC post offsets,
> >>> which are not exposed via the current CTM uapi.
> >> We do have its equivalent test in kms_color_chamelium
> >> and it seems its passing
> >> https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=af49bc8e4e7d1c69ce04f9a1196c167456e8344a
> >> Is it wrong?
> > Hmm. Looks like the test has nothing really to do with the
> > CTM (despite the name), and instead if just uses identity CTM
> > and puts the limited range equivalent data directly into the
> > fb. So I guess technically it could sort of work.
> >
> > For the chamelium version the port will chop off the extra
> > low bits so I guess that explains why it works.
> I recently dumped port images of this test on chamelium. Since this test
> is consistently passing on BMG; however failing on PTL.
> 
> What i observed is
> 
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-A-DP-1-capture-ece4-ece4-ece4-ece4.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-A-DP-1-reference-0000-0000-0000-0000.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-B-DP-1-capture-ece4-ece4-ece4-ece4.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-B-DP-1-reference-0000-0000-0000-0000.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-C-DP-1-capture-ece4-ece4-ece4-ece4.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-C-DP-1-reference-0000-0000-0000-0000.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-D-DP-1-capture-ece4-ece4-ece4-ece4.png
> /tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-D-DP-1-reference-0000-0000-0000-0000.png
> 
> CRC of reference and captured images are not same. Ref is all black. But 
> still test is passing :/
> Is test broken even for chamelium?

Looks like it:
1. creates a bunch of all black fbs
2. manually draw limited range equivalent content into one fb
3. set the output to full range
4. commit
5. redraw the same fb with full range contnet
6. set the output to limited range
7  *no* commit
6. capture the frame and compare against the all black fbref

So looks completely broken to me, and I don't see how that could
be passing on anything unless the chamelium frame comparison code
itself is broken.

> >
> > The crc version is more tricky:
> > - g4x presuambly won't work because the port color range
> >    bit won't affect the pipe crc
> > - ilk-ivb/vlv/chv won't work because TRANSCONF_COLOR_RANGE_SELECT
> >    doesn't seem to affect the pipe crc either
> > - icl+ uses the output csc for the limited range conversion
> >    so the gamma LUT lsb chopping doesn't do anything, so we may
> >    get some differences in the low bits
> > - hsw-glk maybe could work if we do enable CTM+gamma since then
> >    we'll end up doing the limited range adjustment on the gamma LUT
> >    and thus it can chop off the low bits. If we didn't enable
> >    both CTM and gamma then the limited range conversion would be
> >    done on the pipe CSC and thus it would behave exactly like icl+.
> >

-- 
Ville Syrjälä
Intel
