Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EE5E77173
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 09:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8C010E4A8;
	Mon,  9 Dec 2024 09:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=atlas.cz header.i=@atlas.cz header.b="f5cSfMLF";
	dkim-atps=neutral
Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF9F10E31E
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Dec 2024 09:24:44 +0000 (UTC)
Received: from gmmr-2.centrum.cz (localhost [127.0.0.1])
 by gmmr-2.centrum.cz (Postfix) with ESMTP id D4DB820166B3
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Dec 2024 10:24:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
 t=1733649882; bh=pe6CkuJ1cCvPOWFI+LJYQlYjXCFXaX41LJcj8hMbZlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5cSfMLFv4kqdlPBzUxvutgQ/5nS6/YR9Awci4+Fpgzx2XluJUexakwqtJ+//tDOV
 3J6hGsuZt5iK0UwQAxZzX6h4SpO/jjdWAkWATPoHGKOLLuqrNksh1PcIREFwpChbSn
 ZGzNY/+T9cosOWbaffF0Wl7CzNfrto3vG63clohs=
Received: from antispam31.centrum.cz (antispam31.cent [10.30.208.31])
 by gmmr-2.centrum.cz (Postfix) with ESMTP id D2EC7200C073
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Dec 2024 10:24:42 +0100 (CET)
X-CSE-ConnectionGUID: OQlBguGsSOKC/D481NkvWA==
X-CSE-MsgGUID: z4nMIBGzRwWCAZDoTvgYTw==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2FxBADAZFVn/03h/y5aHgEBCxIMQAmBPwuFJYRWkXGKJ?=
 =?us-ascii?q?IFShjaBIIpMgX4PAQEBAQEBAQEBCUQEAQGFBwKKaic2Bw4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBDQEBBgEBAQEBAQYGAQKBHYU1U4JiAYN/AQEBAQIBIw8BRgULC?=
 =?us-ascii?q?w0LAgImAgJWBhODAYIwAQMOI65KeoEyGgJlhHvXcwJJBVVigSqBGi6ITgGKY?=
 =?us-ascii?q?kKCDYJQgW8+iB6CaQSCPIMng0qQCYwQUnscA1kgAREBVRMXCwcFgSkhLAOBH?=
 =?us-ascii?q?oILgVsFN0eCSmlLNwINAjaCJH2CTYUXgQsDg1uEWIYlghoVHUADC209NxQbB?=
 =?us-ascii?q?pwgRoNYgQ7JLYMcgQiETZ0RM5dtA5JhLphNqSqBUB4OggEzIjCDIlIZ0Vd3P?=
 =?us-ascii?q?AIHAQoBAQMJgjuOGYFLAQE?=
IronPort-PHdr: A9a23:Csnx8h2vsABP0R74smDOZgMyDhhOgF0UFjAc5pdvsb9SaKPrp82kY
 BeGo6o2xweQFcWDsrQY0LKQ6/ihEUU7or+/81k6OKRWUBEEjchE1ycBO+WiTWDdErvBQhd+I
 v5/UkR49WqwK0lfFZW2TVTTpnqv8WxaQU2nZkJ6KevvB4Hdkdm82fys9J3PeQVIgye2ba9vI
 BmsogjcuNQajZFgJ6s/xRfFvmZEcPlSyW90OF6fhRnx68ms8JJ57yhcp/ct/NNcXKvneKg1U
 bNXADM6Pm4v+cblrwPDTQyB5nsdVmUZjB9FCBXb4R/5Q5n8rDL0uvJy1ieCMsL6VK45Vzu/4
 atzRxDmlCkINzgi8GHKkcNwl75UoAigpxNk3YHZZpyeOedkcaPcedMaQndBXtpUWidcDI6wc
 5cDAuwcNutDsYLzu0UBoge/BQm0BePg1DlIhmPt3aYn1+gtCBzK0BA8E94Ltnnfsdf7O7oIU
 e2twqfGzSvNYu1L1zn+5ojHfQwuruyDU71yasfR1UoiGhnZglmMtYDoPTWY3fkNvWiB6OpgU
 PqihXQ5pAFtuDik28gjhZPPhocLyVDP6CJ0z5wvJd27UkF7ZMSrEIFLui6AK4t2RtktQ3pyt
 Ckmy7wLoJi2dzUFx5o73RDQceCHc5SW7RL5UuacOSt1iX1qdbywiRi/9UutxO3yW8e7zlpHr
 iVIn8XRunwQ2RLe9NaLR/t880u/xTqC1wLe5v1YLU03iKfVK4MszL42m5EOskrDBjf7lUr3g
 aOMaEkp+uil5/75brn4ppKQLY15hwPmPqgzmMGyAv40PhYOUmWb4+iwybzu8E7jTLhJj/A7l
 LTSvorAKsQBvKG5BhdY0oMk6xmiETiryM8YnXwbLFJdfxKHkpTpN0nOIP/mCfe/hEyhkDhux
 /zfJb3hB4nNLmDenLv9Z7py91BTyAwvzdBF+pJUD6sNL+7yW0PptdzYCAE2MxCszuvoCdhxz
 J0SVGKPD6ODLq/er1+F6vgtLuSOfIMVvSzyK/kh5/7gl385nlodcLGz0psNa3C3BPFmLF+DY
 Xf3mNgBDWMKsRAlTODwlFKDUCZfZ2yuUKIk+jE7FIWmAJ/ZSY+wmryB3T20HptMamBCEF+MC
 2rod4CfVPgScy+dPshhkjgAVbe7UIAh0guuuxXgx7V7KerU/zUUtYj/29ht++3TiRYy+CR1D
 8SSz2GBVnx7kX0WRzIt2KB/oFd9ykuY0aRijfxYD8Jc6O1UXQgkLp7czPB6C9fqWg7bedeJU
 lmmTs2gAT4qVt0x2cMBY15hG9W+iRDOxzSmD6cImLyIBZw097rR0WD+Kclz1XjIyLUsgV8+T
 sRSMG2pnLR/+BTLCoDRikuXj6mkebwH3C7V+meO1XKAslhAXgB/SanFRmgfZkXOotT5+EzCS
 7iuBKw/PAVY0cCMJfgCVtq8oVhYSfPkINHTZX75nm6xAReOyfuIbZH2M2saxm38J3RMvDgut
 UqBMgwlTnOgrH6bADFwPVbueF/3t+dkpX63Q1Q30waSKUp72Ozm1AQSgKmkRu8JlowNvoQi4
 2F9BlW02tvMI9OcowN6Oq5ON4BuqGxb3H7U4lQudqerKLpv0xtHK1wfgg==
IronPort-Data: A9a23:7iUIgqq2Lk6FYP7QVMgIPafSE1deBmJ9ZBIvgKrLsJaIsI4StFCzt
 garIBnVaKqOY2P9eo1+btjjoRsG6JPVztNiTAFtqys9Qy9G9uPIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOWn9D8kiPzgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5OZYQXNNwJcaDpOt/vZ8EM35ZwehRtB1rAATaEW1LPhvyZNZH4vDfnZB2f1RIBSAtm7S
 47rpJml/nnU9gsaEdislLD2aCUiGtY+6iDT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWaqYEl51Y/KWyIzxZDEDe812FfUuFLYquhFTu+TLp6HNWyOEL/mDkCjalGDXkwp6KTgmy
 BAWFNwCRje6g8i53Z2gcc5PrYMPcJmyGoABhVg1mFk1Dd5+KXzCa6rPoMRdwC9p3oZFEPDCf
 dccLzF9BPjCS0ERfA1KVdRkxrru2SaXnz5w8Tp5oYI++WvayQVr+LHxNNPOPNeYLSlQthnI9
 zycrjSlav0cHM7Dzx+k2F2+vPDwtgrJdIUuCrKJyuE/1TV/wURWUnX6T2CTqPWji0e4HdZWM
 VER8CcGpq828EWhScP0GRa/pRasvxEAHtZdDcU+6RqR0eza+QuUCmUfTSJGcJohrsBeeNAx/
 gPX2Ym0WHo16uDTFi31GqqokA5e8BM9dQcqDRLohyNZizU/iOnfVi7yc+s=
IronPort-HdrOrdr: A9a23:g+iVVKqdbxtjFg+pNxNqv3kaV5omeYIsimQD101hICG9vPb2qy
 mLpoV/6faSskd0ZJhAo6HjBEDuexnhHPJOjLX5eI3SOzUO21HYT72Kj7GC/9SIIUSXndK1l5
 0BT0EUMrPN5DZB4frH3A==
X-Talos-CUID: 9a23:4ujAuWzMKzgmsZCqMKu7BgUzI8QPfWDy10z3AGT/JTo5EZuWV2C5rfY=
X-Talos-MUID: 9a23:Z/ycfAYXE9zG5eBTpWPqoRBIG9VS/JuFIXIhlqkYtPi4Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,217,1728943200"; d="scan'208";a="78962984"
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
 by antispam31.centrum.cz with ESMTP; 08 Dec 2024 10:24:42 +0100
Received: from arkam (nat-86.starnet.cz [178.255.168.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id CE7A780911A4;
 Sun,  8 Dec 2024 10:24:41 +0100 (CET)
Date: Sun, 8 Dec 2024 10:24:40 +0100
From: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <202412892440-Z1Vl2JjW1W30ZH4q-arkamar@atlas.cz>
References: <20241103171806.10248-1-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103171806.10248-1-arkamar@atlas.cz>
X-Mailman-Approved-At: Mon, 09 Dec 2024 09:20:22 +0000
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

Hi igt-devs,

On Sun, Nov 03, 2024 at 06:18:06PM +0100, Petr Vaněk wrote:
> PATH_MAX constant is defined in limits.h header file. It needs to be
> explicitly included in musl environment as it is not transitively
> available for any of available includes.

gentle ping. It has been a month since I sent the patch.

Cheers,
Petr

> Fixes: 9366bee04d16 ("lib: Add DRM driver sysfs profiling knob toggling functions")
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
> ---
>  lib/igt_profiling.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> index b61506742..e1526ad98 100644
> --- a/lib/igt_profiling.c
> +++ b/lib/igt_profiling.c
> @@ -10,6 +10,7 @@
>  #include <assert.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <limits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -- 
> 2.45.2
> 
