Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62809F459F5
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 16:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1461510E98B;
	Fri, 10 Apr 2026 16:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GetvtqwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882B410E98B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775839005; x=1807375005;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=7Xz7Nd3Zmh1iC8FSP/a704XTIHFK+S85DplzMbPX1JQ=;
 b=GetvtqwTCmnK2QHyjzA0ntfYLv6BSddjF9Qcoy7+IVaTTzk0iUjh8gru
 /70/RGOrhD+OOfsVHGMwdDk05AV+L/CNGyDBoBw9lB3DtQbljQC1OkUKu
 R8MX2XqKiR0CJcSSDr+qwKKMvaZ96ogSSLiwWUrKsgIkTl4eHvu9YYHcK
 cqS+4aQ0FnYTyvKgOeB2ZHwvgvyszbrjH+97RZ/M/+SgjXIIYuiy1hnD1
 mIf/O+LREcRN1msK0biI10TKn2KvYkzEGYf1TVoW1JPRuWPas9vGU/ETp
 Wek1FwYTeHHBYu6NY+cURfvd5U58kHATzyh+PUBBkpqYJQYvNg9JKCxyn w==;
X-CSE-ConnectionGUID: 0UPppMMaSlOpoIkt50NMPQ==
X-CSE-MsgGUID: m/inM00kSDG9I4fKPOw0fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88246728"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="88246728"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 09:36:44 -0700
X-CSE-ConnectionGUID: AeP+Xa+nT4Wkh/IlAXN1gw==
X-CSE-MsgGUID: T1TdG54YR8erJit2kyHKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="230848485"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 09:36:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 7/7] tests/kms_writeback: use
 for_each_connector_mode()
In-Reply-To: <IA1PR11MB6467BB397635AC8B4F62B494E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1775679624.git.jani.nikula@intel.com>
 <a29343913a5cc0b9f20017719f75b91eae3fe603.1775679624.git.jani.nikula@intel.com>
 <IA1PR11MB6467BB397635AC8B4F62B494E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
Date: Fri, 10 Apr 2026 19:36:39 +0300
Message-ID: <fe3a36d4e10cd42fb99d2842e91163c8dce7e8c9@intel.com>
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

On Thu, 09 Apr 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jani
>> Nikula
>> Sent: Thursday, April 9, 2026 1:51 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH i-g-t 7/7] tests/kms_writeback: use
>> for_each_connector_mode()
>> 
>> We have	a helper for looping the output	modes. Use it.
>> 
> Nit: Please remove extra space. With this

Whoops, somehow a bunch of tabs crept in the commit messages. Fixed
while applying.

> Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

Thanks a lot, pushed.

BR,
Jani.

>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  tests/kms_writeback.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
>> f15abba96765..d189f2f04657 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -468,10 +468,14 @@ static igt_output_t
>> *list_writeback_modes(igt_display_t *display)
>>  		igt_output_t *output = &display->outputs[i];
>> 
>>  		if (output->config.connector->connector_type ==
>> DRM_MODE_CONNECTOR_WRITEBACK) {
>> +			drmModeModeInfo *mode;
>> +			int j = 0;
>> +
>>  			igt_info("\tname  vref hdis hss hse htot vdis vss vse
>> vtot flags type clock\n");
>> -			for (int j = 0; j < output->config.connector-
>> >count_modes; j++) {
>> -				igt_info("[%d]", j);
>> -				kmstest_dump_mode(&output-
>> >config.connector->modes[j]);
>> +
>> +			for_each_connector_mode(output, mode) {
>> +				igt_info("[%d]", j++);
>> +				kmstest_dump_mode(mode);
>>  			}
>>  			break;
>>  		}
>> --
>> 2.47.3
>

-- 
Jani Nikula, Intel
