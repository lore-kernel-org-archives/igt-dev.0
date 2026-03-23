Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3393DF4613B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 15:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1B910E153;
	Mon, 23 Mar 2026 15:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewh8uM54";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFE110E120
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774280621; x=1805816621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UUxadMReAdWDSih4rMWNwTO2vhkuzAXd53uc08MRs88=;
 b=ewh8uM54LmjOWtekYw6YhtXE2OZAFFa6xlINxlsp9dAKz7CzDLuLvs+P
 KL5zH2qwN+QA1Jho7ATCeLgljH2lLOk0JzxKEh+7MHrGG+7hUL6PjI/Pq
 agESjqv/prjGQkiy+dj53phhhlfPLtKbxmLVS0IMqeuOx0QgPELQWDW4c
 EYcuaCf9euQGOMV6nJTP7vxQaj7d557byV4IcbHKgZgzryrBSvkGE3Wlw
 e4USzfF+h1etEFOm2tN193Q3lo25qTDJUj3q3Cac3htj1zXu/OMCpbdLc
 gKMCl+arv+k2djUb9PsIw5SLtCEM8bt77RbmEoNS8LEJSNVEIKrKN1HbP Q==;
X-CSE-ConnectionGUID: i8FXYiktRLycte+/DyygzA==
X-CSE-MsgGUID: 7erQbOO3Tv+oLUeE785TDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="77890814"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="77890814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:43:40 -0700
X-CSE-ConnectionGUID: gc0zFk2bTrCOSt7GKY11eg==
X-CSE-MsgGUID: FV7zre0STfa22JO844TYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="261984276"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:43:37 -0700
Date: Mon, 23 Mar 2026 17:43:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
Message-ID: <acFfpWxozSezlo7E@intel.com>
References: <20260323070228.1383377-2-sk.anirban@intel.com>
 <acEPc8IixAYNuP5U@intel.com>
 <6c1cd079-abbd-4487-b19f-bdf5e9f46c17@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c1cd079-abbd-4487-b19f-bdf5e9f46c17@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Mar 23, 2026 at 08:06:44PM +0530, Anirban, Sk wrote:
> Hi,
> 
> On 23-03-2026 03:31 pm, Ville Syrjälä wrote:
> > On Mon, Mar 23, 2026 at 12:32:29PM +0530, Sk Anirban wrote:
> >> Fix the unit mismatch caused by interpreting seconds as milliseconds
> >> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
> >> to ensure correct unit handling.
> >>
> >> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> >> ---
> >>   tests/intel/xe_pm_residency.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> >> index 61b63ed4f..46718a444 100644
> >> --- a/tests/intel/xe_pm_residency.c
> >> +++ b/tests/intel/xe_pm_residency.c
> >> @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
> >>   		 * elapsed time during suspend is approximately equal to autoresume delay
> >>   		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
> >>   		 */
> >> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
> >> +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
> > Why doesn't the test actually measure this?
> 
> Since rtcwake is being used to enter s2idle, both paths end up using a 
> 15‑second delay as the command parameter
> 
> and this value is carried through all related calculations. Are you 
> suggesting switching to a monotonic clock–based approach during resume?

CLOCK_BOOTTIME

-- 
Ville Syrjälä
Intel
