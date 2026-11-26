Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CBC606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=bTRGZdKQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974BC10E425;
	Thu, 26 Nov 2026 19:33:06 +0000 (UTC)
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com
 [165.173.180.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B7E10E9A0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 19:31:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1795721516; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SXgDhCGdgVnkEAvGE5WBH5DTzPXaDmr3uMwEAEzKNsHtSvFhX5olGOS8KT9gBunsV1cfN1tmsIRjtk89DZ6m3dinDkaza/rXfCyH4gfvOlNFDz2stNcaNeKKqPGgLzrOlo2Rz9NQXCX6S5Eo3VfLXT+Lt4TPN6O6R+ecRxivuRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1795721516;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=+bTvGmGEClbWY4fYFB1/KdXuAuSodcMlk2DoMHEGtMY=; 
 b=HVLdDGMT3JQGSUkpVcI7PYtzASF9gNqFebKl0YCMzIbSTYX0Qyg30t/hBsfTAw2r0bkfHcbcpYszWUCqEdlBYd+5+CNchassBDDGN0bvgtcniDjiA7gZmwj9+6k6QEYdy2kfUbkyY9imYIdyGq1DBlx/wjuX1Wi8CXlDqFKBXq8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=simon.zeni@collabora.com;
 dmarc=pass header.from=<simon.zeni@collabora.com>
DKIM-Signature: a=rsa-sha256;
 b=bTRGZdKQlogdxdhL954KIgukJj3JazaL6Zm0lf0W7xTPqHCKzAuKIkIDAuTWWU2Vrv6z1yAY0tw/i5a5vajrpUQNBK7OqDwlHQ/cxXymsuQCewu9jMO2fQevz2Jz+1NFcr25h06VskXgKa3hhTen1QLdp6aDIRIedO0Fi/rsyWU=;
 c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1;
 bh=+bTvGmGEClbWY4fYFB1/KdXuAuSodcMlk2DoMHEGtMY=;
 h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795721513299847.2070603255662;
 Thu, 26 Nov 2026 11:31:53 -0800 (PST)
Message-ID: <cb536739-7e88-41ae-9e5a-764600606819@collabora.com>
Date: Thu, 26 Nov 2026 14:31:47 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] drm_uapi/fourcc: sync with drm-next
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261125193826.57420-1-simon.zeni@collabora.com>
 <uc66fmbmf42s7vsm5un3tvbrzg5zwxqnhgnasggdpbx6u3hz7d@cjghja2dmazj>
Content-Language: en-US
From: Simon Zeni <simon.zeni@collabora.com>
Organization: Collabora
In-Reply-To: <uc66fmbmf42s7vsm5un3tvbrzg5zwxqnhgnasggdpbx6u3hz7d@cjghja2dmazj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kamil,

Thanks a lot for the feedback, I added the commit hash to the subject, 
and the list of changes. I used a range with the following command from 
the commit hash in 909157f3c to get an exhaustive list of changes.

 > git log --oneline d7126c0cfc13..601c30449 include/uapi/drm/drm_fourcc.h

I'll send a v2 with the new message and your r-b shortly.

Cheers,

Simon


On 11/26/26 9:46 AM, Kamil Konieczny wrote:
> Hi Simon,
> On 2026-11-25 at 14:37:08 -0500, Simon Zeni wrote:
> 
> can you add a commit hash in subject? Something like:
> 
> [PATCH i-g-t 1/3] drm_uapi/fourcc: sync with drm-next 601c30449
> 
>> Sync with drm-next commit 601c30449 (" Merge tag 'drm-misc-next-2026-11-13' of
>> https://gitlab.freedesktop.org/drm/misc/kernel into drm-next")
> 
> It would be better to describe which commits enters here,
> for example in drm-next:
> 
> git log --oneline -- include/uapi/drm/drm_fourcc.h
> 
> will give:
> a77fa227bb0c drm/fourcc: Add Apple Interchange layout format modifier
> 6a03efb8613a drm/fourcc: Add modifiers for AMD GFX6-8
> 19d584a634fe drm/fourcc: Fix descriptions of 32b float formats
> 3c8ed384503f drm/fourcc: Add DRM_FORMAT_XVUY2101010
> 7db42b1718da drm/fourcc: Add DRM_FORMAT_T430
> e8e388c30180 drm/fourcc: Add DRM_FORMAT_XYYY2101010
> c0f8aaa7dcec drm/fourcc: Add DRM_FORMAT_Y8
> b718f0418420 drm/fourcc: Add DRM_FORMAT_P230
> a1b6cf8e5e7e drm: uapi: Use SPDX in DRM core uAPI headers
> 21f6bcdf2be7 Merge tag 'drm-misc-next-2026-02-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
> e9e0b48cd15b drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
> 3aecd55af5b8 drm: add ARM interleaved 64k modifier
> 
> imho you can skip 'Merge tag' line but I do not know what is the
> oldest here, at least it should be up to SPDX. You can also look
> into igt with:
> 
> git show a31c48a76e88
> 
> drm-uapi/xe: sync with kernel f99a05cc0b85
> 
> Sync Xe drm uapi with drm-next up to commit f99a05cc0b85, this
> will bring following changes:
> 
> f99a05cc0b85 ("drm/xe/uapi: Add UAPI support for purgeable buffer objects")
> 716c11d462c5 ("drm/xe/uapi: Define drm_xe_vm_get_property")
> [cut]
> 
> imho something like this could help us see a range of changes.
> 
>>
>> Signed-off-by: Simon Zeni <simon.zeni@collabora.com>
>> ---
>>   include/drm-uapi/drm_fourcc.h | 465 ++++++++++++++++++++++++++++++----
>>   1 file changed, 418 insertions(+), 47 deletions(-)
>>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil

