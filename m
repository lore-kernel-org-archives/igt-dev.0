Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FA7CD1288
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 11:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A307810EB35;
	Mon,  1 Apr 2024 11:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="kmfqyF0l";
	dkim-atps=neutral
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9510ECAC
 for <igt-dev@lists.freedesktop.org>; Sun, 31 Mar 2024 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1711894876; x=1712154076;
 bh=upwJlau6TraWqJ21C4H63zZCkwsnGktmCsIx21u6Obk=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=kmfqyF0lgmnkbgoNC/HZ9Cg2iMg4TdmxfmiBTvANN2KqjVbqLMJpmEhpoKU405Wo+
 kTG4Jc+NJGAd6E96PlrxfrUFQf2pCAdim6ECEEG5h7wp6zEI9uM5jPp3WXYd0J2BKW
 gurWtWSiNnoGJoeparya9dzvc90kcawFZYf7lzwS1hMrdtBfOElJOsLnyJ1Y5RQDf/
 hBcw6JypAq+WWp1GY5xRyTY7YShIQvV3cknx0xety8bJP1vPiA+sNkXm3a9TmndlOY
 UpPEuwhFZHg7Fv5wmzqsIcoXmVyDFxO1p4SobHqwVDN6MJDFUKPWuYldkfHomq368w
 ZQX/KsCWqEh/g==
Date: Sun, 31 Mar 2024 14:21:05 +0000
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: tranquillitycodes@proton.me
Subject: [PATCH i-g-t] tools/intel_gpu_frequency: `perror` when opening the
 sysfs node fails
Message-ID: <cUWLB__vhgdDrNB2WYs-GB18a1SCXBKG1MVc_OVNMHezpXlQDnTW0IatOR2M7YzjUnXQYlsn5iVIm_YGCzpdekEZmO0igQex9N8kyJiII0M=@proton.me>
Feedback-ID: 97370461:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 01 Apr 2024 11:54:40 +0000
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

This makes the tool more friendly to newcomes who aren't familiar with
it.
---
 tools/intel_gpu_frequency.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index de0c6ddba..7082ad2b0 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -84,6 +84,9 @@ initialize_freq_info(struct freq_info *freq_info)
 =09freq_info->path =3D get_sysfs_path(freq_info->name);
 =09assert(freq_info->path);
 =09freq_info->filp =3D fopen(freq_info->path, freq_info->mode);
+=09if (freq_info->filp =3D=3D NULL) {
+=09=09perror("Opening the control failed");
+=09}
 =09assert(freq_info->filp);
 }
=20
--=20
2.44.0





