Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FB826E342
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2020 16:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 626342A6048
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2020 18:39:29 +0200 (CEST)
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id AhvleQey7D4U for <igt-dev@lists.freedesktop.org>;
 Fri, 21 Aug 2020 18:39:29 +0200 (CEST)
Received: from kaveri (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 09CE12A6016
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2020 18:39:29 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94)
 (envelope-from <michel@daenzer.net>) id 1k9A4e-004UzE-Bh
 for igt-dev@lists.freedesktop.org; Fri, 21 Aug 2020 18:39:28 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Date: Fri, 21 Aug 2020 18:39:26 +0200
Message-Id: <20200821163928.1072379-1-michel@daenzer.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/2] tests/kms: Turn off pipe as well if all
 planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpJbiB0aGUgc2FtZSBz
cGlyaXQgYXMgODhlMzc5Y2VmOTcwICJrbXNfY3Vyc29yX2xlZ2FjeTogS2VlcCBwcmltYXJ5CnBs
YW5lIGVuYWJsZWQgZm9yIFhSR0Igb3ZlcmxheSBmYWxsYmFjayIsIGFsbG93IHR3byBtb3JlIHRl
c3RzIHRvIHdvcmsKb24gc2V0dXBzIHdoZXJlIHRoZSBwcmltYXJ5IHBsYW5lIGNhbm5vdCBiZSBk
aXNhYmxlZCB3aGlsZSB0aGUgcGlwZSBpcwplbmFibGVkLgoKTWljaGVsIETDpG56ZXIgKDIpOgog
IHRlc3RzL2ttc19wbGFuZV9tdWx0aXBsZTogVHVybiBvZmYgcGlwZSBhcyB3ZWxsIGlmIGFsbCBw
bGFuZXMgYXJlIG9mZgogIHRlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbjogVHVybiBvZmYgcGlw
ZSBhcyB3ZWxsIGlmIGFsbCBwbGFuZXMgYXJlCiAgICBvZmYKCiB0ZXN0cy9rbXNfYXRvbWljX3Ry
YW5zaXRpb24uYyB8IDE5ICsrKysrKystLS0tLS0tLS0tLS0KIHRlc3RzL2ttc19wbGFuZV9tdWx0
aXBsZS5jICAgIHwgIDggKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMTYgZGVsZXRpb25zKC0pCgotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
