Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80771C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 19:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9578810F2EB;
	Thu, 11 Apr 2024 19:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="nOm4c4Uu";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477D810F2EB
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 19:53:43 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VFr3b2xdbzDqvH;
 Thu, 11 Apr 2024 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1712865222; bh=jV5b1TeeZXBrG+4EHhcMh6YD6YBsNl/zBU3E1VoGdSY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nOm4c4UuFI9hPKP9uxpZ1/xzKbtRU3/TaFEKQIuEuJznOCV3T1vIhWKDbGpZfj6+8
 /49sTW+BlnL63xmFwdEVAwvTKi1hlIbde+a7Z5A99zsjpAevg4uFz7us/uLL8W9qUs
 U2gWSYyZmY5HsXDfvauF4/uXtbv6TtPtzAklAtGQ=
X-Riseup-User-ID: D882C7979A0445D89BDBF40C00DFE271ED37A825BB0FE1CDBAD8CE7652029AF4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VFr3X4cWfzJtVr;
 Thu, 11 Apr 2024 19:53:28 +0000 (UTC)
Message-ID: <b4dbbe53-f16c-4430-a5da-7be5d17a20ae@riseup.net>
Date: Thu, 11 Apr 2024 16:53:26 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v4 0/7] benchmarks/kms_fb_stress: benchmark formats
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
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

	

On 11/04/24 15:51, Arthur Grillo wrote:
> After some discussion[1], I changed how to tackle the problem. (2x)
> 
> With the upcoming addition of YUV format to VKMS[2] it would be great to
> test the their performance. So, test all formats available.
> 
> - PATCH #1: Just a non-related assert that I found needed while developing
> - PATCH #2: Log the KMS structure
> - PATCH #3: Moving code, should be noop
> - PATCH #4 & #5: Fix a couple of bugs found while developing
> - PATCH #6: Add a enable_overlay flag in preparation for #7
> - PATCH #7: The new benchmark that tests performance between format
> 
> [1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/
> [2]: https://lore.kernel.org/all/20240304-yuv-v4-11-76beac8e9793@bootlin.com/

I forgot to add some sample output:

(kms_fb_stress:182) igt_kms-WARNING: Output Writeback-1 could not be assigned to a pipe
IGT-Version: 1.28-g932c859782a1 (x86_64) (Linux: 6.8.0-rc6-virtme x86_64)
Using IGT_SRANDOM=1712863941 for randomisation
Opened device: /dev/dri/card0
(kms_fb_stress:182) igt_kms-WARNING: Output Writeback-1 could not be assigned to a pipe
Starting subtest: default-stress
KMS structure:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: XRGB8888
		rectangle: 3639x2160+101+0
	overlay A:
		format: XRGB16161616
		rectangle: 3033x1777+201+199
	overlay B:
		format: ARGB8888
		rectangle: 1507x1400+1800+250
	writeback:
		format: XRGB8888
		rectangle: 0x0+0+0
Time spent in the loop with 100 frames: 40.485739s.
Subtest default-stress: SUCCESS (41.617s)
Starting subtest: formats
KMS structure:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: ARGB8888
		rectangle: 3639x2160+101+0
	writeback:
		format: ARGB8888
		rectangle: 4096x2160+0+0
Time spent in the loop with 100 frames: 27.605521s.
KMS structure:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: XRGB8888
		rectangle: 3639x2160+101+0
	writeback:
		format: XRGB8888
		rectangle: 4096x2160+0+0
Time spent in the loop with 100 frames: 27.990571s.
KMS structure:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: XRGB16161616
		rectangle: 3639x2160+101+0
	writeback:
		format: XRGB16161616
		rectangle: 4096x2160+0+0
Time spent in the loop with 100 frames: 27.755050s.
KMS structure:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: ARGB16161616
		rectangle: 3639x2160+101+0
	writeback:
		format: ARGB16161616
		rectangle: 4096x2160+0+0
Time spent in the loop with 100 frames: 26.409543s.
KMS structure:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: RGB565
		rectangle: 3639x2160+101+0
	writeback:
		format: RGB565
		rectangle: 4096x2160+0+0
Time spent in the loop with 100 frames: 164.752689s.
Subtest formats: SUCCESS (278.339s)

> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> Changes in v4:
> - Change (again) how the new test is done, now it just uses the primary
>   and writeback, and changes the formats based on primary format list.
>   (Pekka Paalanen)
> - Add an enable_overlay flag, for the new test.
> - Remove the addition of command-line flags, as I don't see them that
>   useful anymore (Pekka Paalanen)
> - Change the RGB565 test to a stride test (Pekka Paalanen)
> - Link to v3: https://lore.kernel.org/r/20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net
> 
> Changes in v3:
> - Make the help message and commit message more clear on how the
>   command-line options work (Louis Chauvet)
> - Link to v2: https://lore.kernel.org/r/20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net
> 
> Changes in v2:
> - Change how the command-line options work, now they pin the specific
>   format and let the other change.
> - Add a patch to test all the possible formats combination
> - Add a couple of patches to fix some bugs
> - Move the KMS logging patch to the beginning of the series
> - Move the default_kms definition to the static struct data_t variable
> - Link to v1: https://lore.kernel.org/r/20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net
> 
> ---
> Arthur Grillo (7):
>       benchmarks/kms_fb_stress: Assert that we have an supported pipe
>       benchmarks/kms_fb_stress: Log the KMS structure
>       benchmarks/kms_fb_stress: Separate the benchmark in a subtest
>       benchmarks/kms_fb_stress: Free resources on the stress procedure
>       benchmarks/kms_fb_stress: Don't paint the FB's if the format is not supported by Pixman
>       benchmarks/kms_fb_stress: Optionally enable the overlay planes
>       benchmarks/kms_fb_stress: Create a benchmark for formats
> 
>  benchmarks/kms_fb_stress.c | 252 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 192 insertions(+), 60 deletions(-)
> ---
> base-commit: e490cb6ffc497275544b36871c24af0a04f98470
> change-id: 20240226-kms_fb_stress-dev-c93ae176f901
> 
> Best regards,
