Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF56FCD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 17:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7840610E10C;
	Fri, 19 Jun 2026 17:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cG0uN1JL";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA0B10E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 17:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781891505; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GjvJUaGuL9GYHPeJAzxKrEihotLV02KyO6n0l1zucRLuiC58JBp/bHtiWQrTIVSOgpoC4Meerut0PIrRvvPa428cPid2IvcHv9RoD+PHWdzO3dzHTFvklMJztxR1OO9lRj5VR2SKxFJgsasi8Vegrrvg+AhC97cysRcBYu0tkGo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781891505;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UTUL9J4lDiqhWWRaVN5N3vIG2PDDPZ6OC3Jb7b834HA=; 
 b=a4250SUrqX+kS5Raaww63y+ZdM3ZCsvG0x7abDj2tRedswAuawz7v05o9JKpKpCGbABcx0orZAvXMXXrOtqXAmhG298QqErlxYqQV/R2NasLL0ZXGzn+l4l3S7q0ARBMPI9YvkN5srbMkEBGXbz3TWZkVHmllEHpGAE1vEvk3b8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781891505; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Date:Date:Message-Id:Message-Id:Reply-To;
 bh=UTUL9J4lDiqhWWRaVN5N3vIG2PDDPZ6OC3Jb7b834HA=;
 b=cG0uN1JLZCGZokUwLi4wqO1akakiIl91vnAbo/rc3I8+oAmDMeerLCikG+aGZmaA
 /Naf8PaO6WSN8oRFD5qBdpUfcAsBvL6OxNk0ASqGMgS1YEiVV6EQo/I8G3+iMaiKLlb
 f3k2DV2HD74rUvjVVFdsPScXRQSw/cBD2PzPJxCs=
Received: by mx.zohomail.com with SMTPS id 1781891502945948.0650384261247;
 Fri, 19 Jun 2026 10:51:42 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/3] drm-uapi/panthor: sync with kernel 12cf826bf1dd
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 igt-dev@lists.freedesktop.org, kernel@collabora.com
In-Reply-To: <20260619-panthor-sparse-mappings-v3-1-cb6c230b6bc0@collabora.com>
References: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
 <20260619-panthor-sparse-mappings-v3-1-cb6c230b6bc0@collabora.com>
Date: Fri, 19 Jun 2026 18:51:32 +0100
Message-Id: <178189149269.2080348.18346981464239204066.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=326;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=r+o7qUlxVtLyuOImt5K29j8fO9tQD5p52zESAdzp0Xg=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqNYGsQ8/vuqneUoMYyOG89bcWNjHSlvqxoWCkF
 EJVp2wuMTOJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajWBrAAKCRAOJn5M7lND
 PcTVC/4i7C8FBmlmj8pQZDU8OLoTkRiAOJ8mX4Z5koGUjzCYCL/RWKBwyMfkbpYWpZiUAYh/C2o
 DF/5wTQHxHbISQRk4UxCBNdRppfNdFP4Fy3LoXNYBe/IDoI0EhlSTj55wgBkoaFUKXhg7E4wLOe
 CaRXsPIvy5XD7FFTl+AISYMXH56WIq85qRG5oL9FYj7rpS2Lm4/3cqXbuEy3lhQ92jVTUeErqZv
 hqU4raCnYJBUnTZxZEK9D0rj2KXTXtJml1ODko2p9SdohqFxLAPvwp4H26vQzC10mISUJWwvWtd
 A93vf8aWCbNyOlgLl+yCDha0dMyw7LzaIbhDhJ6UaFVkWFyQC25zJ+CMaypBw7MWxO6nQKSajD9
 6TuvVVi5sJx5Fs+VXEnicjRL+h9+iHFY4/PbXUDljW/yW3Uaqu4CuWOTGVltKmNkM77otWpAPMI
 pNcdZWyMjRqqaf68q4+8Tk69pJjZJwwGiYalCobiByMWJySk7MaAKKV0Bf1fIHzscBFEE=
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

On Fri, 19 Jun 2026 14:54:28 +0100, Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> Sync Panthor drm uapi with drm-next up to commit 5731bca6a656, this
> will bring following changes:

Typo here, the branch I brought these changes in from was drm-misc-next.

-- 
Adrián Larumbe <adrian.larumbe@collabora.com>
