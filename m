Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81417E91261
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 06:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180FE10E201;
	Thu,  5 Feb 2026 06:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNPCsXuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245DF10E201
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 06:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770271423; x=1801807423;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=s9ymsfFfuxs9SmcePUhurAyZypzl07QcPl33cJYacXw=;
 b=iNPCsXuFqWQiTn2ngxDxoYMkmIAb4C6hYfdIHJRikS1BwV9++tekcGj4
 jd9lybdCvXkZMSjKRmrIKKVtvEMm4FE6Cun8ZlzHVQ/XE7GL0s7eRYeks
 uajIGlpPOtJmBYY+VGZQvdp62hYlqyTwDIF+xrqJ4bZoJGDZe2K6jL0U2
 PfME+6t25N77Dws+4hhmlaqUuk9DBPohVaTg+HXjQ/pATK3qBTu8i1jQq
 1OjKG3wJOcLZ8u4Q+pz52PoUXTkDxg0hYc1KIYLwjZYfJ6pq41paDWnbp
 8oN8+EqC/B2kk7Osv4gqJSD7gwsZp4Ly8eJmDC0jJ3oIi3G+hbX3/8zht A==;
X-CSE-ConnectionGUID: v4BEx7vzRJuyLCQqeGH6Xw==
X-CSE-MsgGUID: BCE+4Im0SNOs2cA32ToTWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96919855"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="96919855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 22:03:42 -0800
X-CSE-ConnectionGUID: RSasGRFpR6G373wYo0fgxQ==
X-CSE-MsgGUID: EpSN2dBLShGNE3bKgGCnSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210187351"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.113.248])
 ([10.66.113.248])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 22:03:41 -0800
Message-ID: <1bb42632-93ee-4765-9453-6758d08a573a@intel.com>
Date: Thu, 5 Feb 2026 11:33:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2,2/3] tests/intel/kms_psr2_sf: Check pipe and output
 validity for Selective Fetch test
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260203061036.21482-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260203061036.21482-3-jouni.hogander@intel.com>
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

Hello Jouni,

Please find comments inline,

On 03-02-2026 11:40, Jouni Högander wrote:
> There are some restrictions in pipe usage for PSR2/PR Selective
> Fetch. Implement helper to checks these restrictions and use it to figure
> out if pipe/PSR/PR combo in data_t is valid. Also check if used output
> supports PSR/PR.
>
> v2: rebase and commit message updated
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 134 ++++++++++++++++++++++----------------
>   1 file changed, 78 insertions(+), 56 deletions(-)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 0eae34cbd..776068104 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1084,18 +1084,37 @@ static bool check_pr_psr2_sel_fetch_support(data_t *data)
>   	return status;
>   }
>   
> +static bool sel_fetch_pipe_combo_valid(data_t *data)
> +{
> +	if (intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 14 &&
> +	    !IS_ALDERLAKE_S(intel_get_drm_devid(data->drm_fd)) && data->pipe != PIPE_A)
> +		return false;
> +
We already cache data->devid in the fixture can we reuse that here

With above
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> +	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
> +	    data->pipe != PIPE_A && data->pipe != PIPE_B)
> +		return false;
> +
> +	return true;
> +}
> +
>   static bool
> -pipe_output_combo_valid(igt_display_t *display,
> -			enum pipe pipe, igt_output_t *output)
> +pipe_output_combo_valid(data_t *data)
>   {
> -	bool ret = true;
> +	bool ret = psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				    data->psr_mode, data->output);
> +	if (!ret)
> +		return ret;
> +
> +	ret = sel_fetch_pipe_combo_valid(data);
> +	if (!ret)
> +		return ret;
>   
> -	igt_display_reset(display);
> +	igt_display_reset(&data->display);
>   
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
> -	if (!intel_pipe_output_combo_valid(display))
> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
> +	if (!intel_pipe_output_combo_valid(&data->display))
>   		ret = false;
> -	igt_output_set_crtc(output, NULL);
> +	igt_output_set_crtc(data->output, NULL);
>   
>   	return ret;
>   }
> @@ -1265,11 +1284,12 @@ int igt_main()
>   						   append_psr_subtest[z],
>   						   op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i], outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   
> @@ -1291,11 +1311,12 @@ int igt_main()
>   							   append_psr_subtest[z],
>   							   op_str(data.op)) {
>   					for (i = 0; i < n_pipes; i++) {
> -						if (!pipe_output_combo_valid(&data.display,
> -									     pipes[i], outputs[i]))
> -							continue;
>   						data.pipe = pipes[i];
>   						data.output = outputs[i];
> +
> +						if (!pipe_output_combo_valid(&data))
> +							continue;
> +
>   						igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   							     "Selective fetch is not supported\n");
>   						if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1316,12 +1337,12 @@ int igt_main()
>   						   append_psr_subtest[z],
>   						   op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1338,12 +1359,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1360,12 +1381,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1382,12 +1403,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1404,12 +1425,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1427,12 +1448,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1448,12 +1469,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1470,12 +1491,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1492,11 +1513,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display, pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1514,12 +1536,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
> @@ -1539,12 +1561,12 @@ int igt_main()
>   			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
>   						   append_psr_subtest[z], op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display,
> -								     pipes[i],
> -								     outputs[i]))
> -						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> +
> +					if (!pipe_output_combo_valid(&data))
> +						continue;
> +
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
>   						     "Selective fetch is not supported\n");
>   					if (!check_psr_mode_supported(&data, psr_status[z]))
