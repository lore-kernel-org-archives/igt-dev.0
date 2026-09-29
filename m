Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD05ECA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCC910E9B4;
	Tue, 29 Sep 2026 09:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lsnpIs6+";
	dkim-atps=neutral
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com
 [74.125.228.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4DD10EDBB
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:16:22 +0000 (UTC)
Received: by mail-pz2-f43.google.com with SMTP id
 d2e1a72fcca58-8633a38df87so1639777b3a.2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790673382; x=1791278182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0cYPYuCP15tg0qrFUF6Y+3Dce4LdS3hppi3kVoULxGk=;
 b=lsnpIs6+4rUMYCNkyxqkfOdf7PxgtF15QYgo6HEv2PgrG22kS81SUygsIcuHZBJjAa
 ZsJUTaPJC0qczlmz+PSGhG5YzczXEpkLdMUjkyCbUNIu4cMLGyJ2Fh3bZefYY3oemEkj
 jfYebnY6vcSha3JPm4dyJjJfS0IdPz918y7i8bAM8yfJiLB63aVZysHdo5JltB8SLumm
 Te1NJ/fCkEF3IyrkjII84ESxf9tLmJiLGL1NrOK2hjXEJl/l664+9lSoTTdtefbpJYuW
 mJFBNQ0ozL7vzvSzp3gf9lLNrIF93GftUi4oemupoErHzpMKTGpr3JshOtZBSfifDFXn
 SxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790673382; x=1791278182;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0cYPYuCP15tg0qrFUF6Y+3Dce4LdS3hppi3kVoULxGk=;
 b=BCkKClOYyDKTPAD7PoLLyLu2Sg0Csy+s3cKkLv3OwayM4xbcwYgJV5PcvZtA/njkvm
 qb+9sVClzkre8YrzSvEVffYbmlFU1wRCL2eb6zIbFVnRJB43IXLSEsLLfscoOIsJUaJd
 C3s2WE6GuhEC64t07/FGQZrVa9zMxIut7T20fNL3HVh8UqJQR1OiVBPlzlgGrrV1/KF0
 hQusBiJZhcz4KjVcPcBNv6axdiOCDJp9nncSgMv2SOKGKulHfw7tBMi4w1JEdwdItbuX
 j5Y5re9BXaQJHKm4+mb2XhK1XcZei6cfxZZ9HQE4xdzXlO6gdPjWtLiY9/U2mwaCl33j
 0OPA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdQYfQTTe9xb9W+LF8XACNN571bEYZAjvVugORlJCS7MftQ7xCVqioDfyDoeB/QFJPrGTqkY10@lists.freedesktop.org
X-Gm-Message-State: AFuF++loSbuR2yOKTKIYqn0x5Z4/RxCYDVBEWllh7DYCYJoJT9lm+9IW
 atxbwX4L0isMHz+4dp1jRXgREn2aVeieJNKWG0idBCtwwRkEu3cFOcXX
X-Gm-Gg: AYBFou3fc5abkFOa+HLa+iv8aZ2ecOMd6VKAIBLdAWB9uV21ACuDzozz13pKWSc+L6V
 Bj4Vp2iMOn+YzAD5S9CzVm9CYiQO6yNZaqjf5pNm7eOP2XGDQwl0gtkCbIRD2OWG1fBBEAx9BuK
 g8P8gF53a14WtVHx9rRpP37HGwhkevf7JWw9jUlu+i+AYOHgPBAbGVNHV+IQLH8qY6iKUW+fpJc
 ufhHUAjxPYw5aWb+BwyrFxA6lJCR/LV195HFdNUvgT9v7ZcmszPcDUn9jD4TNEmrdCoEWJrHRYX
 pasZYj1MAgRVwNVM2U2SaVI0LV38V51gyxWZNx3LEEP28nQDVneswcka4NWpBb+sbm3ZUgsgZRF
 h1eR2o13nDdyFXGEhm05rb9WlDfJCJXjLQy1eNc/Rv/Idn6y9eZe3tny4ktos7ix5ebz5Ls7rV/
 w1YCV4rF3E7yO5e6Ck0XCcRDvKcCTfc4MN/KdRMpbNBgFvSCJw8lATt27AzD7ZB8YPtxQeDQwa8
 uwea/6WlDGdffCY2G3gXf9FH+SWaFUW7kSaNt1HCg==
X-Received: by 2002:a05:6a00:2296:b0:881:423:5309 with SMTP id
 d2e1a72fcca58-88104237066mr8056275b3a.18.1790673381919; 
 Tue, 29 Sep 2026 02:16:21 -0700 (PDT)
Received: from [192.55.54.45] ([192.55.54.45])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-885e163f383sm469227b3a.23.2026.09.29.02.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 02:16:21 -0700 (PDT)
Message-ID: <a8a0283c-c6f1-45e8-9e3c-ed1b1e5cb983@gmail.com>
Date: Tue, 29 Sep 2026 12:16:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 6/7] tests/intel/kms_ccs: limit #crtcs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, michal.grzelak@intel.com
References: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
 <20260924075019.4151374-7-michal.grzelak@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260924075019.4151374-7-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Michal,

On 24/09/2026 10.50, Michał Grzelak wrote:
> Limit execution of suspend tests to first and last active CRTC unless
> using `extended` flag. This reduces default execution time of the test.
> In turn this can lower chances of hitting CI timeout.
> 
> Currently first and last CRTC coincide with first and last pipe. In
> future this is likely to change due to pipe reordering. It should not
> affect the test overall since the aim is to pick two arbitrary CRTCs.

I don't think this is good idea, we want deterministic tests for ci. We 
want to know what rendering pipe was in use, will be less guesswork when 
trying to figure out bugs. Choosing arbitrary pipe will anyway affect 
test execution for sure from pov of what need to get enabled and what 
features given pipe has.

> 
> When `first' and `last' is set outside of dynamic subtest scope, it
> results in build failure caused by Meson receiving SIGSEGV:
> 
> 	FAILED: tests/kms_ccs.testlist
> 	/usr/bin/meson --internal exe --capture tests/kms_ccs.testlist -- [..]/tests/kms_ccs --show-testlist
> 	--- stderr ---
> 	Received signal SIGSEGV.
> 
> 	ninja: build stopped: subcommand failed.
> 
> Thus set them inside dynamic subtest's scope.
> 
> v5->v6
> - describe how pipe reordering affects the test (Jani)
> 
> v3->v4
> - set `first' and `last' indices outside of crtc loop (Mohammed)
> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 8526f1ccfd..5bc5215eb7 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -191,6 +191,7 @@ typedef struct {
>   	int fb_list_length;
>   	bool do_hibernate;
>   	bool all_outputs;
> +	bool all_crtcs;
>   	struct {
>   		struct igt_fb fb;
>   		int width, height;
> @@ -1132,6 +1133,8 @@ static void test_output(data_t *data, const int testnum)
>   	igt_crtc_t *crtc;
>   	uint16_t dev_id;
>   	int output_count = 0;
> +	uint32_t first;
> +	uint32_t last;
>   
>   	igt_fixture()
>   		dev_id = intel_get_drm_devid(data->drm_fd);
> @@ -1147,6 +1150,9 @@ static void test_output(data_t *data, const int testnum)
>   
>   		igt_describe(tests[testnum].description);
>   		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
> +			first = data->display.crtcs[0].crtc_index;
> +			last = data->display.crtcs[data->display.n_crtcs - 1].crtc_index;

you could just loop here for those crtcs and check for crtc->pipe


> +
>   			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
>   			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
>   				igt_require_f(intel_gen(dev_id) >= 20,
> @@ -1176,6 +1182,10 @@ static void test_output(data_t *data, const int testnum)
>   					if (!intel_pipe_output_combo_valid(&data->display))
>   						continue;
>   
> +					if (!data->all_crtcs && (data->flags & TEST_SUSPEND) &&
> +					    crtc->crtc_index != first && crtc->crtc_index != last)
> +						continue;
> +
>   					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
>   						int valid_tests = 0;
>   
> @@ -1232,6 +1242,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>   	case 'n':
>   		data->all_outputs = true;
>   		break;
> +	case 'e':
> +		data->all_crtcs = true;
> +		break;
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -1246,9 +1259,10 @@ static const char *help_str =
>   "  -s <seed>\tSeed for random number generator\n"
>   "  -r\t\tOn suspend test do full hibernate with reboot\n"
>   "  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
> +"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
>   ;
>   
> -int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
> +int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)
>   {
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

