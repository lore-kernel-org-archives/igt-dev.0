Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D54C36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0C510E72E;
	Tue,  8 Apr 2025 18:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e2Cx5MvS";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9510E72A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=spsFTzNRW1cuNBLx9kbOTuEZ/eXG6jRJ11tcOId9UDw=; b=e2Cx5MvSAm9PrvvaPs3t3M97i/
 P2BdALggcFFdLdO1xtCEBQzIFAol9KHz6dINYdlht4oYeWB0dJ9iZfsirjUooAAHqffGTppaaFWGA
 QnBce8vfl0iLYow2nFQuLJFLfwsTlhL/w4BbMfr4OmYupwSVRdLrONv65hT6FSWfG9arhMrtuyGkI
 7HQLXPrT24j51sf+gcCsSX18E6yvUmGVKUCUtvtY0QDWQw1oUpbvxniFfBW64XKinOZ+YydiNtNiX
 bny3QiXEx3SP4LV7s4UBdVQlFaABGp6RsVyJ2lRundSezlv2J2jCSuaLWgpUGlbZd7xKwez8dwEkf
 /LiR8luA==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u2DzW-00DSZl-OJ; Tue, 08 Apr 2025 20:48:11 +0200
Message-ID: <0ab1d923-a966-4ce8-9719-65158f8caa20@igalia.com>
Date: Tue, 8 Apr 2025 15:48:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] tests/kms_async_flips: Check for atomic async flip
 cap
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-3-andrealmeid@igalia.com>
 <j2kam7redmh5qqqbbunyuoyl235vg3bw32yoqq4azbb4mfrztw@aaepkfnv5u5f>
 <c0b93100-cc37-4f24-8324-3ad4a26d0908@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <c0b93100-cc37-4f24-8324-3ad4a26d0908@igalia.com>
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



On 08/04/2025 13:07, André Almeida wrote:
>> + igt_require_f(ret > 0, "Atomic async flip cap doesn't exist in
>> this kernel\n");
>
> Maybe should be like this:
>
> igt_require_f(ret >= 0, "Atomic async flip cap doesn't exist in this 
> kernel; or bad fd\n");
Indeed. ACK.
>
>> + igt_require_f(ret, "Atomic async flip not supported by this
>> driver\n"); 

