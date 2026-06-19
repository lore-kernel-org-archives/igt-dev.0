Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C1CD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 17:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B9210E0E0;
	Fri, 19 Jun 2026 17:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="CbTRuyc7";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8710F6C1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 17:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781891314; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CB/OG21aqgcQuYw7kI+TgSvGi2QDfACQ6S8s39xDPksFSl68i4OJNcT2NHCHOkEkgTCSBpZAw0bcG+twNjXz9nnyJiTw0+6j1t1544xBkTVea1OzA+5qFG6oz3QVjA7RYf9O+ZqDCTfPYNpaHGHNDrlLVTq+R8SRGsCA4H2naSY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781891314;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KzqqMusM0ibGmQi9BtnhU4dEeMuSU3iLaypOUddZeeg=; 
 b=HZil8JR+Ftz5zzuPv0cpU34ncd4lRTtZ5YrYs3+Nix3W+650eu8MP0XKYn/LwOsnur9Fd2aDe95yb/m+n4Jr2ejuVqtmNaD8TSDIgZ7ssYFeJuooTfLI+XvGilIsJLhZ9jhu2JSJC+kMcBb1SQCUsOG39xvTr026ONU/FNkA/GM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781891314; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Date:Date:Message-Id:Message-Id:Reply-To;
 bh=KzqqMusM0ibGmQi9BtnhU4dEeMuSU3iLaypOUddZeeg=;
 b=CbTRuyc7DlFw2CpQs/VKzI2TIRa3NhKkzMIdGyWU3oGRXEZMTcK+6H37ZQxK0zsm
 ODR8WtONJ44rSYqxyROCM7F9Wffl62xkTqm/l1FldjPjSfXPg401EgfP+SDv0Z8k6vG
 xLoHPzIHujLs1L1Rpyn+7lLM85w2whw8jQ2IFsgA=
Received: by mx.zohomail.com with SMTPS id 1781891312969554.252117953695;
 Fri, 19 Jun 2026 10:48:32 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?Re=3A_=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Test_pa?=
 =?utf-8?q?nthor_sparse_mappings_=28rev2=29?=
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
In-Reply-To: <178187876001.96724.10559100857577766119@6beec6c84f66>
References: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
 <178187876001.96724.10559100857577766119@6beec6c84f66>
Date: Fri, 19 Jun 2026 18:48:26 +0100
Message-Id: <178189130648.2080348.17821135476629772028.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=YK5pu6IeWvKSef/E4NZPpX102Ll9x1de6/InX6sA6XE=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqNYDwS5Dr6BIHjVp76Mk0kle8eG+Uei/FYAJ5w
 n4p3lAvRmWJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajWA8AAKCRAOJn5M7lND
 PbQsC/9d6Ce5G0ha5WCh0hkRcGJXEFmvf5i2S3VFB6y2I9xTnsE9Bdz4R502arNyN7eJYY/Hm9O
 ySPxbv3VmOxJSmdAnPtYiq8siUGH9dnxlmrV8waSi9Lql1bkYIyulkeAkugcZQQECkLmGh2+L7d
 1Lq8TF+ownnLhZS0MI741uxfd0pnIff0lu48ELR7kJ475vNuKOAlrzKbYDFoMm70xo5t9iVRGKN
 yXGqCd7Q+hSpA+K+yEDjLT48LwY9pPP11pe4SR5CQabeDY+0kJeorPM+zP6s97Cay+ArCiN1U4n
 0KKMvjX/6cFDxfsTkdxfKn+ND9NzzZac3PJcLtSsTr6JGd24Ek7ynzisw0nhdrLE8Lu8F51PRBl
 IV4ZsVoSJ0PNiyDV0/ZeybwoRE/iUK71T4PLabGDaXXyqqJ27wz/qzD0sYSiTfxFAVL/0vQwL4z
 N0qb3VwexWLiD1Bm7jfR2dIAoMWohkGw3EYnIVeNIA2lXgL18Np2IpC+6ANNRviMUS1CA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D
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

On 2026-06-19 14:19:20+00:00, Patchwork wrote:
> == Series Details ==
> 
> Series: Test panthor sparse mappings (rev2)
> URL   : https://patchwork.freedesktop.org/series/166234/
> State : failure
> 
> == Summary ==
> 
> Using index info to reconstruct a base tree...
> M	lib/igt_panthor.h
> Falling back to patching base and 3-way merge...
> Auto-merging lib/igt_panthor.h
> CONFLICT (content): Merge conflict in lib/igt_panthor.h
> Patch failed at 0002 panthor: Add IGT library helper for Panthor sparse mappings
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> Applying: drm-uapi/panthor: sync with kernel 12cf826bf1dd
> Applying: panthor: Add IGT library helper for Panthor sparse mappings

This is probably because of the vm_bind range check patch series having just been merged.
Will rebase and resend a new revision.
