Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F00C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 21:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E259D10E37B;
	Fri, 14 Feb 2025 21:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czXumyB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EB610E37B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739567099; x=1771103099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f0eaUVqDrN/ROuBPWxgMCHE7fZyRz5jVURLLOxZZw0w=;
 b=czXumyB9nyucwk+d+K/7DRO0lvT++vgPE70EjnzGAnAjKLDrTCvsQlMR
 frpepWLGi0xhCa164syCZlPIQRr3KHCPdLdqV5P51DM40VvP39cJZW0tz
 WAVlb9hgPoOVWyoxceRlOBMkauzhSKiBdMnB4ElhdxaWyaJVqaHqKcXdo
 s6J9iijC+JrJaVMncGU6zAoLIvr9cSSJZqoZTfuiKMA5o1THb2tQw32tS
 PR9YzCmihL5+6+3jHJwQ5AuwxWv4j5hh62K41DKSfiRi3xjLvsxIJKvWW
 5QBB48zKs5AsPaRLvM9ovKITohPPmutuIvXlRs3kQ4Z2ZeNQxXGavEV22 Q==;
X-CSE-ConnectionGUID: mMg1JgavSwee9m0lHdBbeQ==
X-CSE-MsgGUID: jl6eGk8HRpu7tkLtkA6SoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44092957"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="44092957"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:04:59 -0800
X-CSE-ConnectionGUID: IhdymUUeR/yBRrIMUzl8gQ==
X-CSE-MsgGUID: wIMXjRJuRTK2+YNKddzrCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113754492"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 14 Feb 2025 13:04:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Feb 2025 23:04:56 +0200
Date: Fri, 14 Feb 2025 23:04:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
Message-ID: <Z6-v-I4F2Os8vXCa@intel.com>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
 <Z699roJnvD0kO4Ne@intel.com>
 <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
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

On Fri, Feb 14, 2025 at 11:56:27PM +0530, Sharma, Swati2 wrote:
> Hi Ville,
> 
> On 14-02-2025 11:00 pm, Ville Syrjälä wrote:
> > On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
> >> This tests is currently disabled since CRC computed on Intel
> >> hardware seems to include data on the lower bits, this is
> >> preventing us to CRC checks.
> >>
> >> Let's try to enable it back and check behavior on newer Intel
> >> platforms.
> >>
> >> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> >> ---
> >>   tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
> >>   1 file changed, 93 insertions(+), 73 deletions(-)
> >>
> >> diff --git a/tests/kms_color.c b/tests/kms_color.c
> >> index 4b71d3dd3..c3b285b4e 100644
> >> --- a/tests/kms_color.c
> >> +++ b/tests/kms_color.c
> >> @@ -58,6 +58,7 @@
> >>    * @0-75:           for 0.75 transparency
> >>    * @blue-to-red:    from blue to red
> >>    * @green-to-red:   from green to red
> >> + * @limited-range:  with identity matrix
> >>    * @max:            for maximum transparency
> >>    * @negative:       for negative transparency
> >>    * @red-to-blue:    from red to blue
> >> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
> >>    * This test is currently disabled as the CRC computed on Intel hardware seems
> >>    * to include data on the lower bits, this is preventing us to CRC checks.
> >>    */
> >> -#if 0
> >> -static void test_pipe_limited_range_ctm(data_t *data,
> >> +static bool test_pipe_limited_range_ctm(data_t *data,
> >>   					igt_plane_t *primary)
> >>   {
> >>   	double limited_result = 235.0 / 255.0;
> >> -	static const color_t red_green_blue_limited[] = {
> >> +	color_t red_green_blue_limited[] = {
> >>   		{ limited_result, 0.0, 0.0 },
> >>   		{ 0.0, limited_result, 0.0 },
> >> -		{ 0.0, 0.0, limited_result },
> >> +		{ 0.0, 0.0, limited_result }
> >>   	};
> > This whole thing is fundementally broken. We can't generate
> > limited range output without using the CSC post offsets,
> > which are not exposed via the current CTM uapi.
> We do have its equivalent test in kms_color_chamelium
> and it seems its passing 
> https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=af49bc8e4e7d1c69ce04f9a1196c167456e8344a
> Is it wrong?

Hmm. Looks like the test has nothing really to do with the
CTM (despite the name), and instead if just uses identity CTM
and puts the limited range equivalent data directly into the
fb. So I guess technically it could sort of work.

For the chamelium version the port will chop off the extra
low bits so I guess that explains why it works.

The crc version is more tricky:
- g4x presuambly won't work because the port color range
  bit won't affect the pipe crc
- ilk-ivb/vlv/chv won't work because TRANSCONF_COLOR_RANGE_SELECT
  doesn't seem to affect the pipe crc either
- icl+ uses the output csc for the limited range conversion
  so the gamma LUT lsb chopping doesn't do anything, so we may
  get some differences in the low bits
- hsw-glk maybe could work if we do enable CTM+gamma since then
  we'll end up doing the limited range adjustment on the gamma LUT
  and thus it can chop off the low bits. If we didn't enable
  both CTM and gamma then the limited range conversion would be
  done on the pipe CSC and thus it would behave exactly like icl+.

-- 
Ville Syrjälä
Intel
