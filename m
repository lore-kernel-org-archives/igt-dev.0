Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B004AC77B7C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 13:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FBB10E144;
	Wed,  2 Jul 2025 13:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWooeK84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4610E144
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751462467; x=1782998467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1Tn/ahFeyJ1uue9quwteQJTHmHKlTj5MTtXHTQau3pk=;
 b=dWooeK84sqtfN1shHPoAavgAbVH4kdWNi0cp6jDpIfUTAUZWNBhAlj9Q
 2TkfXg1vPAMRpCkqxhbeWTHTGtKTQflhcqMysWkD0zEFnhAqDWvPq8fIj
 ZYDUmU5HGUldR1ZxHc9dUXdANJTHVvQE17QEhgvt58xLqIT5KGRCkJgOR
 IdRM9SpP/TS6nB2tRZ482uUsPsyP0xWzt5OG3y/nryHzdOF9WClFdiAXc
 qYlcHsWUnmecs3Q6dHyOLXCF/RU0EKqhXRoalas2gU1fgxNNBG+5ZHowX
 7qnvPa1a7Nu7VMA1zvR149HuH9NaEm1YEvAFtjfUZPEtEW7/hwyEtoHHo w==;
X-CSE-ConnectionGUID: 7to0bdD4RHaBZ/WbBGgxzw==
X-CSE-MsgGUID: imPkpNOXQjWq2oNRk/ZNjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53685087"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53685087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:21:07 -0700
X-CSE-ConnectionGUID: 03X2xv08Rs6ipxtEv/gXew==
X-CSE-MsgGUID: N+aAssyKSI6/fSDRgMhShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158638263"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:21:04 -0700
Date: Wed, 2 Jul 2025 15:21:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t v3] tests/kms_cursor_crc: optimise cursor crc on
 simulation
Message-ID: <20250702132102.s55zwxhq3j4fmdmg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com, pranay.samala@intel.com
References: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-07-02 at 14:46:43 +0530, Santhosh Reddy Guddati wrote:
> Reduce the number of test crc iterations on simulation to avoid timeouts
> on simulation.
> 
> V2: Avoid usage of extra variable to check run_in_simuation (Pranay)
> V3: Initialise max and avoid unnecessary bump (Kamil)
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_cursor_crc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index cacd2402c..8a465dc6b 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -490,10 +490,15 @@ static void test_crc_offscreen(data_t *data)
>  static void test_crc_sliding(data_t *data)
>  {
>  	int i;
> +	int max;
> +
>  	struct {
>  		igt_crc_t crc[3];
>  	} rounds[16] = {};
>  
> +	/* In simulation, we only run a few rounds to keep the test fast */
> +	max = igt_run_in_simulation() ? 4 : 16;
> +
>  	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
>  	 * no alignment issues. Horizontal, vertical and diagonal test.
>  	 */
> @@ -502,7 +507,7 @@ static void test_crc_sliding(data_t *data)
>  	cursor_enable(data);
>  	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
>  
> -	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
> +	for (i = 0; i < max; i++) {
>  		do_single_test(data, i, 0, true, &rounds[i].crc[0]);
>  		do_single_test(data, 0, i, true, &rounds[i].crc[1]);
>  		do_single_test(data, i, i, true, &rounds[i].crc[2]);
> @@ -510,7 +515,7 @@ static void test_crc_sliding(data_t *data)
>  
>  	/* SW test */
>  	cursor_disable(data);
> -	for (i = 0; i < ARRAY_SIZE(rounds); i++) {
> +	for (i = 0; i < max; i++) {
>  		do_single_test(data, i, 0, false, &rounds[i].crc[0]);
>  		do_single_test(data, 0, i, false, &rounds[i].crc[1]);
>  		do_single_test(data, i, i, false, &rounds[i].crc[2]);
> @@ -526,6 +531,9 @@ static void test_crc_random(data_t *data)
>  
>  	/* Random cursor placement */
>  
> +	if (igt_run_in_simulation() && max > 10)
> +		max = 10;
> +
>  	/* HW test */
>  	cursor_enable(data);
>  	igt_plane_set_fb(data->primary, &data->primary_fb[HWCURSORBUFFER]);
> -- 
> 2.34.1
> 
