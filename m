Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892AAEC01AF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3792810E2B2;
	Mon, 23 Mar 2026 09:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLW0QYL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694F510E2B2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258172; x=1805794172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L0RBQMF6dc9CbDb2tI5n4NUle8ttEAi2C7T45Qh+k9c=;
 b=VLW0QYL4p/ndp9X5TP5cuW74k0k841MgKo3XGCmBK0QzivorW74ZiWpC
 GGw5rHepp1uy9Zyx0EE8WIRTwDZXO/R0Ff57MycK/97kc4e4+Fvi3/ccd
 Tf1QT9FHaRdzHqaL71FzNK79FMnvNHbrzJkDMZ0L3W0f8H6uDWBGTUQts
 DLn0386qIFdwHegTA5CGj4XQYP78NKLAXD8AMCqDVucZ7KZLqC7Yc8vTt
 Uc6VYbRxUxgGLphVTrEsmSYY+jW7iFmfxGQuOTG2CWX083RbSQMYhFq1j
 0zKh1Do92HEGv4dL5/2ZZezhOxOCxHXFYBCQQpz9B2ridIt/doelOmIHu g==;
X-CSE-ConnectionGUID: 5DL2puU1TmCBvxhtiBFmGA==
X-CSE-MsgGUID: BkxfBnyiTu+jwDtsr4B9Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75276682"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75276682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:29:32 -0700
X-CSE-ConnectionGUID: i0bTp8FeRR+uy/R+5kWrAw==
X-CSE-MsgGUID: wBLa8aC/SpSkxIY5QPTHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254447619"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:29:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Cc: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable
 non-joiner mode for joiner bypass
In-Reply-To: <IA1PR11MB6467222C2F24562B961BEFCDE34BA@IA1PR11MB6467.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260323051049.2627387-1-pranay.samala@intel.com>
 <20260323051049.2627387-3-pranay.samala@intel.com>
 <IA1PR11MB6467222C2F24562B961BEFCDE34BA@IA1PR11MB6467.namprd11.prod.outlook.com>
Date: Mon, 23 Mar 2026 11:29:26 +0200
Message-ID: <2f87dff630bfb060e15f8abf6ec46f88b39297e1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 23 Mar 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
>> Samala
>> Sent: Monday, March 23, 2026 10:41 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
>> <sameer.lattannavar@intel.com>; Samala, Pranay
>> <pranay.samala@intel.com>
>> Subject: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable non-
>> joiner mode for joiner bypass
>> 
>> When joiner mode is detected, fetch a non-joiner mode into local variable
>> and store it into the caller-owned copy.
>> 
>> Also override the selected mode before commit so the programmed output
>> mode matches the mode used by the test.
>> 
>> Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass
>> joiner modes")
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> ---
>>  tests/intel/kms_sharpness_filter.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git a/tests/intel/kms_sharpness_filter.c
>> b/tests/intel/kms_sharpness_filter.c
>> index 96fb139ae..881fab746 100644
>> --- a/tests/intel/kms_sharpness_filter.c
>> +++ b/tests/intel/kms_sharpness_filter.c
>> @@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum
>> test_type type)
>>  	igt_display_t *display = &data->display;
>>  	igt_output_t *output;
>>  	igt_crtc_t *crtc;
>> +	drmModeModeInfo selected_mode;
>>  	char name[40];
>> 
>>  	for_each_connected_output(display, output) { @@ -438,15 +439,17
>> @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>> 
>>  			data->output = output;
>>  			data->crtc = crtc;
>> -			data->mode = igt_output_get_mode(data->output);
>> 
>>  			/*
>>  			 * FIXME: Joiner + CASF currently unsupported.
>>  			 * Remove this check once support is implemented.
>>  			 * Until then, run on non-joiner mode in joiner
>> configuration.
>>  			 */
>> -			if (is_joiner_mode(data->drm_fd, data->output)) {
>> -				data->mode =
>> igt_get_non_joiner_mode(data->drm_fd, data->output);
>
> Hi Pranay,
> I guess instead of retuning bool value we can the pointer whether NULL or not and then assign the mode , something like this:
> If(!igt_get_non_joiner_mode(data->drm_fd, data->output))
>    data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);

Yeah, there are many ways to accomplish the same without changing
igt_get_non_joiner_mode() function.

BR,
Jani.



>
> Thanks,
> Nemesa
>
>> +			if (is_joiner_mode(data->drm_fd, data->output) &&
>> +			    igt_get_non_joiner_mode(data->drm_fd,
>> +						    data->output,
>> +						    &selected_mode)) {
>> +				data->mode = &selected_mode;
>>  				igt_info("Executing on mode %dx%d@%d\n",
>>  					 data->mode->hdisplay,
>>  					 data->mode->vdisplay,
>> @@ -463,6 +466,7 @@ run_sharpness_filter_test(data_t *data, enum
>> test_type type)
>> 
>>  			igt_output_set_crtc(data->output,
>>  					    data->crtc);
>> +			igt_output_override_mode(data->output, data-
>> >mode);
>> 
>>  			if (!intel_pipe_output_combo_valid(display)) {
>>  				igt_output_set_crtc(data->output, NULL);
>> --
>> 2.34.1
>

-- 
Jani Nikula, Intel
