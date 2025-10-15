Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D24CCD19A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 08:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B9A10E2EF;
	Thu, 16 Oct 2025 08:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kiu3gTCY";
	dkim-atps=neutral
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536D10E2A1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 14:15:10 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b48d8deaef9so1201433466b.2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760537708; x=1761142508; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1S5qXanE/VuIqxvbC84/6CXgk/tixS7jomCIV/MIXN4=;
 b=kiu3gTCY7WHd7SIOuUILcf1HblRs2bHlDie7oPB/e+mgWJmmI2P7LKiJgKbaAjivRB
 BuEsBBZThY+5rtfyh4ghyxOdyPmOUS1Jb4xjPMknm9i7JjB1WOueYc2TPXZg9YPDWh2z
 kbcVG0ZWs1nbh3NKF+AQ9OJUabL48+TYQclOM/COLy+kdWmgmyPlzXoIlinPNUOMs0HS
 X2KT5NDGLNiiS6PWQupLEm+SiCPNGYG6MAs+0GP7hzTCp6CAnr7ND1IqvgRASM4gi+uP
 7HDikFJLet1qAzjGBTjwhxft6kWujzfL0VDtKgxBsHbGDqS/G+GI/4YdJFB8HfXE8qLH
 3SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760537708; x=1761142508;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1S5qXanE/VuIqxvbC84/6CXgk/tixS7jomCIV/MIXN4=;
 b=Qw4+nNYGHUHV/o5gd8fEkP4AobcNDNhrY3Cb9yUEsEJ/r5qrh+AmWf0YSHiBUwHvy7
 3NkzbPhiGzo4EqEw/2WHMfYY/HxHiicy5agu+2QP0WAAzs3fhN9rhlUaR0+RaOUccxaw
 Cf7I7roKqzqNTT/JqU6GV2noVZo+TbxkOqwQAWnOD0KVjF3Bypzh7uDtzNcQbhXvR0p9
 y99sbZG9wDCz+IbuLsaigq6DaGLdX18IZyjHvkSJJOJq9cGlIGahkLz+JVfIQVfRezUh
 jqHDYLXnWox1t04RCUni5cEgUg7BxxrkNvK7hSI53TUrIhsM1EW8r+jtmWaByqCky3f/
 FLYQ==
X-Gm-Message-State: AOJu0Yznj0pi9RexWn/kHw2nv7ZheIGNCAkdGpSMRf99RiGo8VwVWhbj
 rCVC74leMafU6RRNYknkLebG7ovXkIH9YUHw5gDNbHz0HU5IGzLDxMdZ6c6J9wgFjKwgthW3C4y
 R0+3t7iPqAxvEaZkOVo8GEXt5dffcUeKCBg==
X-Gm-Gg: ASbGnctY5rQjxDmrI0BMox59f6J4yeSYBdYKP7QeJxFCuAjkUP52BHvuniNiIA7m+vN
 duUnG3oV/efgT5H3E013ziBFtHlfjJM57LTGL+tbr+rC6KWsiRYhOAoWpNYuU4/SZng8/zHqbaa
 iwGevbT2crfQeJtLBAavcNSm1FaqsGgLY4aMwx8PVI1WRRdlD/INzQ4RkKBqS1h4LEtg+4H3tRI
 LGxO8hln/xPuDmsHVin5JSGRXyloUSNNQ==
X-Google-Smtp-Source: AGHT+IH1aia9E/cXyxbAEH5C+CL8MKfjOzFed0fvRxGTr0B9s2di5DIvai5HmnO/U7aR0A0qIXmU88VejI9/obqX4nI=
X-Received: by 2002:a17:906:6a1d:b0:b32:2b60:f13 with SMTP id
 a640c23a62f3a-b50ac9f062amr3219319266b.54.1760537708519; Wed, 15 Oct 2025
 07:15:08 -0700 (PDT)
MIME-Version: 1.0
From: Simon Fairweather <simon.n.fairweather@gmail.com>
Date: Wed, 15 Oct 2025 15:14:56 +0100
X-Gm-Features: AS18NWDWTXqFabgQ9esjSvSFP8XK0tZdWnZE-rP74DXiqK5_Te7Ap23JrD5zOY4
Message-ID: <CA+9vR5EEW80oVGTzhK18BOMAuX1Jyj2BMkB9mXeiqSxh5M5sKA@mail.gmail.com>
Subject: [PATCH i-g-t] Feat: add interation for intel_gpu_top
To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000bb42b8064133207d"
X-Mailman-Approved-At: Thu, 16 Oct 2025 08:47:25 +0000
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

--000000000000bb42b8064133207d
Content-Type: text/plain; charset="UTF-8"

Patch for add iteration to intel_gpu_top

--000000000000bb42b8064133207d
Content-Type: application/octet-stream; name=patch-1
Content-Disposition: attachment; filename=patch-1
Content-Transfer-Encoding: base64
Content-ID: <f_mgs2npeq0>
X-Attachment-Id: f_mgs2npeq0

RnJvbSA3ODY4YjAxNTgxMTQyY2M0NzJmMGMxMDk2NGJjMGM2M2I3MjFlODM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaW1vbiBGYWlyd2VhdGhlciA8c2ltb24ubi5mYWlyd2VhdGhl
ckBnbWFpbC5jb20+CkRhdGU6IFdlZCwgMTUgT2N0IDIwMjUgMTQ6NTE6NTQgKzAxMDAKU3ViamVj
dDogW1BBVENIIGktZy10XSBGZWF0OiBhZGQgaW50ZXJhdGlvbiBmb3IgaW50ZWxfZ3B1X3RvcAoK
U2lnbmVkLW9mZi1ieTogU2ltb24gRmFpcndlYXRoZXIgPHNpbW9uLm4uZmFpcndlYXRoZXJAZ21h
aWwuY29tPgotLS0KIHRvb2xzL2ludGVsX2dwdV90b3AuYyB8IDE1ICsrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90b29scy9pbnRlbF9ncHVfdG9wLmMgYi90b29scy9pbnRlbF9ncHVfdG9wLmMKaW5kZXgg
NTRlNzFlNTU5Li5kMmNjOGQwMWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2ludGVsX2dwdV90b3AuYwor
KysgYi90b29scy9pbnRlbF9ncHVfdG9wLmMKQEAgLTEwNTEsNiArMTA1MSw3IEBAIHVzYWdlKGNv
bnN0IGNoYXIgKmFwcG5hbWUpCiAJCSJcdFstZCA8ZGV2aWNlPl0gICBEZXZpY2UgZmlsdGVyLCBw
bGVhc2UgY2hlY2sgbWFudWFsIHBhZ2UgZm9yIG1vcmUgZGV0YWlscy5cbiIKIAkJIlx0Wy1wXSAg
ICAgICAgICAgIERlZmF1bHQgdG8gc2hvd2luZyBwaHlzaWNhbCBlbmdpbmVzIGluc3RlYWQgb2Yg
Y2xhc3Nlcy5cbiIKIAkJIlx0Wy1tXSAgICAgICAgICAgIERlZmF1bHQgdG8gc2hvd2luZyBhbGwg
bWVtb3J5IHJlZ2lvbnMuXG4iCisJCSJcdFstbl0gICAgICAgICAgICBTcGVjaWZ5IG51bWJlciBv
ZiBpdGVyYXRpb25zLlxuIgogCQkiXG4iLAogCQlhcHBuYW1lLCBERUZBVUxUX1BFUklPRF9NUyk7
CiAJaWd0X2RldmljZV9wcmludF9maWx0ZXJfdHlwZXMoKTsKQEAgLTI2MTgsOSArMjYxOSwxMSBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJc3RydWN0IGlndF9kZXZpY2VfY2Fy
ZCBjYXJkOwogCWNoYXIgKmNvZGVuYW1lID0gTlVMTDsKIAlzdHJ1Y3QgdGltZXNwZWMgdHM7CisJ
aW50IGl0ZXJhdGlvbl92YWx1ZSwgaXRlcmF0aW9uX2NvdW50ID0gMDsKKwlib29sIGl0ZXJhdGlv
bl9jaGVjayA9IGZhbHNlOwogCiAJLyogUGFyc2Ugb3B0aW9ucyAqLwotCXdoaWxlICgoY2ggPSBn
ZXRvcHQoYXJnYywgYXJndiwgIm86czpkOm1wY0pMbGgiKSkgIT0gLTEpIHsKKwl3aGlsZSAoKGNo
ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJvOnM6ZDpuOm1wY0pMbGgiKSkgIT0gLTEpIHsKIAkJc3dp
dGNoIChjaCkgewogCQljYXNlICdvJzoKIAkJCW91dHB1dF9wYXRoID0gb3B0YXJnOwpAQCAtMjYz
MSw2ICsyNjM0LDEwIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJY2FzZSAn
ZCc6CiAJCQlvcHRfZGV2aWNlID0gc3RyZHVwKG9wdGFyZyk7CiAJCQlicmVhazsKKwkJY2FzZSAn
bic6CisJCQlpdGVyYXRpb25fY2hlY2sgPSB0cnVlOworCQkJaXRlcmF0aW9uX3ZhbHVlID0gYXRv
aShvcHRhcmcpOworCQkJYnJlYWs7CiAJCWNhc2UgJ3AnOgogCQkJcGh5c2ljYWxfZW5naW5lcyA9
IHRydWU7CiAJCQlicmVhazsKQEAgLTI4NTgsNiArMjg2NSwxMiBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCiAJCWlmIChkaXNwX2NsaWVudHMgIT0gaWNsaWVudHMuY2xpZW50cykK
IAkJCWZyZWVfZGlzcGxheV9jbGllbnRzKGRpc3BfY2xpZW50cyk7CiAKKwkJaWYgKGl0ZXJhdGlv
bl9jaGVjaykgewkKKwkJCWl0ZXJhdGlvbl9jb3VudCsrOworCQkJaWYgKGl0ZXJhdGlvbl9jb3Vu
dCA+PSBpdGVyYXRpb25fdmFsdWUpCisJCQkJc3RvcF90b3AgPSB0cnVlOworCQl9CisKIAkJaWYg
KHN0b3BfdG9wKQogCQkJYnJlYWs7CiAKLS0gCjIuMjkuMi53aW5kb3dzLjEKCg==
--000000000000bb42b8064133207d--
