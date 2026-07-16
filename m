Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A7C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 08:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE69710F227;
	Thu, 16 Jul 2026 08:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Olg+JcRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5682010F227
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784191302; x=1815727302;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=L5Pd5W66pSnAGHaVexMorIknLxmp28ajJdHuvAvLGhc=;
 b=Olg+JcRoeYe2zIBZeUWg59uOJ+81Lg/5ncAIitFqUGdRKIrDOayJti6A
 N0jDQk2OJegqvNNvbWtYx3ePbFQMk9t7OZHXfxqEuO581ACDozlfICq0E
 8/eEffybadn7oR5T939ONHSHOBex+BHJjFaGQJKFNt9CIi2dvFu+rqudV
 tRZ09PGnue7MtNWCzfoSMYA8b990PhOSEbltbdnox0R56DhYGFVVMO6i7
 5zinXpJQUtGNthjmoj5qbA2yjCkW1jc/8yaqUuctvEuudePPrh2njHHol
 oJh8wjSHW+dNFbvF9wjTR2rwNyFy0QOZt2KDc3440BCAJyBVl2r9hXMGP A==;
X-CSE-ConnectionGUID: UCmmjh4XQiCk/VJKgzNpKQ==
X-CSE-MsgGUID: E2MTQ4N6TLyF1j7rTK2wMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88746961"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="88746961"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:41:42 -0700
X-CSE-ConnectionGUID: qquPNTwRTPiNw8HL6gq0sg==
X-CSE-MsgGUID: U5YAf/CnQl2pFBIwTLb75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="256481884"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:41:41 -0700
Date: Thu, 16 Jul 2026 10:41:38 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
cc: "Grzelak, Michal" <michal.grzelak@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v1 12/16] tests/kms_sharpness_filter: limit #outputs
 tested during suspend
In-Reply-To: <IA1PR11MB6467A9718AEB60E607D3A09CE3F92@IA1PR11MB6467.namprd11.prod.outlook.com>
Message-ID: <964bf595-6ab1-23aa-5df4-404d491d6943@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-13-michal.grzelak@intel.com>
 <IA1PR11MB6467A9718AEB60E607D3A09CE3F92@IA1PR11MB6467.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1914454364-1784191301=:605841"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1914454364-1784191301=:605841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 14 Jul 2026, Garg, Nemesa wrote:
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Michał
>> Grzelak
>> Sent: Monday, July 13, 2026 2:25 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Grzelak,
>> Michal <michal.grzelak@intel.com>
>> Subject: [PATCH i-g-t v1 12/16] tests/kms_sharpness_filter: limit #outputs
>> tested during suspend
>>
>> We are iterating through each output while testing suspend. This results in
>> extended execution time. In turn this leads to hitting CI enforced timeout.
>>
>> By default limit number of tested outputs to 3. Test each connected output
>> when passing command-line parameter.
>>
> What is the rationale behind number 3.

Followed [1]. For kms_flip running 2 pipes and max 3 outputs fit into
the CI's timeout, and 4 didn't. Also needed any number to set the limit.

[1] https://lore.kernel.org/igt-dev/20260330075508.1003899-5-michal.grzelak@intel.com/

BR,
Michał

>
> Regards,
> Nemesa
>
>> v1->v2
>> - remove abbreviations (Jani)
>>
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>> ---
>>  tests/intel/kms_sharpness_filter.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/kms_sharpness_filter.c
>> b/tests/intel/kms_sharpness_filter.c
>> index f2e3fc9494..adec4a60c5 100644
>> --- a/tests/intel/kms_sharpness_filter.c
>> +++ b/tests/intel/kms_sharpness_filter.c
>> @@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test to validate content
>> adaptive sharpness filter");
>>   * is seen without corruption for each subtest.
>>   */
>>
>> +#define OUTPUT_LIMIT 			3
>> +
>>  #define TAP_3				3
>>  #define TAP_5				5
>>  #define TAP_7				7
>> @@ -231,6 +233,7 @@ static const struct subtest_entry {  typedef struct {
>>  	int drm_fd;
>>  	bool limited;
>> +	bool all_outputs;
>>  	struct igt_fb fb[4];
>>  	igt_crtc_t *crtc;
>>  	igt_display_t display;
>> @@ -614,9 +617,16 @@ run_sharpness_filter_test(data_t *data, enum
>> test_type type)
>>  	igt_display_t *display = &data->display;
>>  	igt_output_t *output;
>>  	igt_crtc_t *crtc;
>> +	int output_counter = 0;
>>  	char name[40];
>>
>>  	for_each_connected_output(display, output) {
>> +		if (type == TEST_FILTER_SUSPEND && !data->all_outputs &&
>> +		    output_counter > OUTPUT_LIMIT)
>> +			continue;
>> +
>> +		output_counter++;
>> +
>>  		for_each_crtc(display, crtc) {
>>  			igt_display_reset(display);
>>
>> @@ -766,6 +776,9 @@ static int opt_handler(int opt, int opt_index, void
>> *_data)
>>  	case 'l':
>>  		data->limited = true;
>>  		break;
>> +	case 'o':
>> +		data->all_outputs = true;
>> +		break;
>>  	default:
>>  		return IGT_OPT_HANDLER_ERROR;
>>  	}
>> @@ -774,11 +787,12 @@ static int opt_handler(int opt, int opt_index, void
>> *_data)  }
>>
>>  static const char help_str[] =
>> -	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
>> +	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n"
>> +	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n";
>>
>>  data_t data = {};
>>
>> -int igt_main_args("l", NULL, help_str, opt_handler, &data)
>> +int igt_main_args("lo", NULL, help_str, opt_handler, &data)
>>  {
>>  	igt_fixture() {
>>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> --
>> 2.45.2
>
>
--8323329-1914454364-1784191301=:605841--
