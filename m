Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEB8E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 15:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33FB10E07F;
	Thu, 19 Dec 2024 15:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dragonslave.de header.i=@dragonslave.de header.b="iNuvSLi9";
	dkim-atps=neutral
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Thu, 19 Dec 2024 10:28:47 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294AE10E2BB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 10:28:47 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YDRQk614Wz9svV;
 Thu, 19 Dec 2024 11:21:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dragonslave.de;
 s=MBO0001; t=1734603662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xB9wYRaqXBn+s4z66YmyrBxUJ6jS/oyUfKh71nHurhY=;
 b=iNuvSLi9Svw7ikRX6EYhm5XBENq32Yl/cagEKXamWHRfvA1kOesO017pE44C5fCdaG1Q1Y
 lkrzCZRz6jZe/+xxnYxlNf2KbjAFGUSTt2jCUikA3FU/RAnxYF9V/lAEIIvdWjWFOvcfMA
 qBXsyuEuoXSqUUUHgLEDtZ5VF5n/tynIIipkBE9J+qssCUr+VdPcDHDqHGgkb2bBI503tv
 bQ85Uai7wgGU8M2fTX5zrMkSBzwP+0no1KgAPy3jZ1xe8mfxg/cH0sarN/F7uobgpTy/Pp
 +kRuFn9VMPH+WtpAahG14g5o8irWXcbd90/B37OVNbDXL0N7/kthOnresoSuTA==
Content-Type: multipart/mixed; boundary="------------CxMdymaaPVEvlrRiJNGoME1A"
Message-ID: <622b6179-3b81-4208-88a6-3177839042ea@dragonslave.de>
Date: Thu, 19 Dec 2024 11:21:01 +0100
MIME-Version: 1.0
Content-Language: en-US, de-DE
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: dex@dragonslave.de
From: DeX77 <dex@dragonslave.de>
Subject: [PATCH] lib/igt_aux: Ignore 4th parameter
X-Rspamd-Queue-Id: 4YDRQk614Wz9svV
X-Mailman-Approved-At: Thu, 19 Dec 2024 15:25:37 +0000
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

This is a multi-part message in MIME format.
--------------CxMdymaaPVEvlrRiJNGoME1A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

(please keep me in CC, as I'm currently not subscribed to this Mailinglist)

See attached patch to fix building IGT with recent procps-ng 4.0.5.

Greetings
DeX
--------------CxMdymaaPVEvlrRiJNGoME1A
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-lib-igt_aux-Ignore-4th-parameter.patch"
Content-Disposition: attachment;
 filename="0001-lib-igt_aux-Ignore-4th-parameter.patch"
Content-Transfer-Encoding: base64

RnJvbSBkMzk1YWFkMjJjNWYwYjE0M2M5MzNiOGY2OWI0NzQ0ZTM3OTI5ZWRlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEZVg3NyA8ZGV4QGRyYWdvbnNsYXZlLmRlPgpEYXRl
OiBUaHUsIDE5IERlYyAyMDI0IDExOjE0OjMzICswMTAwClN1YmplY3Q6IFtQQVRDSF0gbGli
L2lndF9hdXg6IElnbm9yZSA0dGggcGFyYW1ldGVyCgpBcyBvZiBodHRwczovL2dpdGxhYi5j
b20vcHJvY3BzLW5nL3Byb2Nwcy8tL2NvbW1pdC85NjdmZGNmYjA2ZTIwYWFkMGYzMTA3MzQ3
NGNiOTQ1NDVjOWJkZWE1CnByb2Nwcy1uZyBubyBsb25nZXIgdXNlcyB0aGUgNHRoICJpbmZv
IiBwYXJhbWV0ZXIgZm9yIGl0cyBWQUwgbWFjcm9zLgoKU2VlOiBodHRwczovL2dpdGxhYi5j
b20vcHJvY3BzLW5nL3Byb2Nwcy8tL2lzc3Vlcy8zMzIKClRoaXMgcGF0Y2ggaXMgbmVlZGVk
IHRvIGJ1aWxkIGlndCB3aXRoIHByb2Nwcy1uZyA0LjAuNQotLS0KIGxpYi9pZ3RfYXV4LmMg
fCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1eC5jCmlu
ZGV4IDM0MDdjYzRmMi4uNzAyOGQzZjU3IDEwMDY0NAotLS0gYS9saWIvaWd0X2F1eC5jCisr
KyBiL2xpYi9pZ3RfYXV4LmMKQEAgLTEzNTgsMTAgKzEzNTgsMTAgQEAgc3RhdGljIGJvb2wg
Z2V0X3Byb2Nlc3NfaWRzKHN0cnVjdCBpZ3RfcHJvY2VzcyAqcHJjcykKIAlwcmNzLT5jb21t
ID0gTlVMTDsKIAlwcmNzLT5zdGFjayA9IHByb2Nwc19waWRzX2dldChwcmNzLT5pbmZvLCBQ
SURTX0ZFVENIX1RBU0tTX09OTFkpOwogCWlmIChwcmNzLT5zdGFjaykgewotCQlwcmNzLT50
aWQgPSBQSURTX1ZBTChFVV9QSUQsIHNfaW50LCBwcmNzLT5zdGFjaywgcHJjcy0+aW5mbyk7
Ci0JCXByY3MtPmV1aWQgPSBQSURTX1ZBTChFVV9FVUlELCBzX2ludCwgcHJjcy0+c3RhY2ss
IHByY3MtPmluZm8pOwotCQlwcmNzLT5lZ2lkID0gUElEU19WQUwoRVVfRUdJRCwgc19pbnQs
IHByY3MtPnN0YWNrLCBwcmNzLT5pbmZvKTsKLQkJcHJjcy0+Y29tbSA9IFBJRFNfVkFMKEVV
X0NNRCwgc3RyLCBwcmNzLT5zdGFjaywgcHJjcy0+aW5mbyk7CisJCXByY3MtPnRpZCA9IFBJ
RFNfVkFMKEVVX1BJRCwgc19pbnQsIHByY3MtPnN0YWNrKTsKKwkJcHJjcy0+ZXVpZCA9IFBJ
RFNfVkFMKEVVX0VVSUQsIHNfaW50LCBwcmNzLT5zdGFjayk7CisJCXByY3MtPmVnaWQgPSBQ
SURTX1ZBTChFVV9FR0lELCBzX2ludCwgcHJjcy0+c3RhY2spOworCQlwcmNzLT5jb21tID0g
UElEU19WQUwoRVVfQ01ELCBzdHIsIHByY3MtPnN0YWNrKTsKIAl9CiAjZW5kaWYKIAlyZXR1
cm4gcHJjcy0+dGlkICE9IDA7Ci0tIAoyLjQ3LjEKCg==

--------------CxMdymaaPVEvlrRiJNGoME1A--
