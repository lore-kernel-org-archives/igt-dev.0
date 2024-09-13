Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805DDEEE26C
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 12:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B9B10ED01;
	Fri, 13 Sep 2024 12:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="qm0JMXyE";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB1B10ED01
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 12:04:06 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4tJQ3wFPzDr9l;
 Fri, 13 Sep 2024 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726229046; bh=B16+MY3AZYEmHqp8yVyHT7VFFqVYonJV3qtdyyiJ+5Q=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=qm0JMXyEGQ1f2D9SvMSEhK8EJqY0ghKud5cnG/9vFFZeVL5fb/lzir6t/b0dYRFqV
 31aoJXcJ6Yjl0/6nbQLQVW6p6DCYsX4fmwZ5gu56YWgyjI1MlXON7O/5bpMYPHzyKw
 USC+gOSBPuGmIOGDsMXTOH6yLPRIvwBwDMCgQ+K0=
X-Riseup-User-ID: 06A077A4DB7FBC0789FA6CB11E6EC2DADEA19C7C491D630E59616D5F3E88E6E4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4tJP5kYzzFtg9;
 Fri, 13 Sep 2024 12:04:05 +0000 (UTC)
Message-ID: <a161b76d-d855-4367-8461-956daeb6b9e7@riseup.net>
Date: Fri, 13 Sep 2024 09:03:36 -0300
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_benchmarks/k?=
 =?UTF-8?Q?ms=5Ffb=5Fstress=3A_benchmark_formats_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
 <172619197765.994521.13831879263501632417@2413ebb6fbb6>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
Cc: I915-ci-infra@lists.freedesktop.org
In-Reply-To: <172619197765.994521.13831879263501632417@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 12/09/24 22:46, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/kms_fb_stress: benchmark formats (rev3)
> URL   : https://patchwork.freedesktop.org/series/132328/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15408 -> IGTPW_11738
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11738 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11738, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11738/index.html
> 
> Participating hosts (39 -> 34)
> ------------------------------
> 
>   Additional (2): fi-cfl-8109u fi-bsw-n3050 
>   Missing    (7): bat-adlp-11 fi-snb-2520m bat-adlp-6 fi-kbl-8809g bat-dg2-14 bat-dg2-13 bat-mtlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11738:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@ring_submission:
>     - bat-arls-2:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15408/bat-arls-2/igt@i915_selftest@live@ring_submission.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11738/bat-arls-2/igt@i915_selftest@live@ring_submission.html
> 
>   
> Known issues
> ------------

I think they are unrelated to my patchset.

Best Regards,
~Arthur Grillo
