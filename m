Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1176E109
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 00:33:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE0914E91A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 00:33:45 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 20 Nov 2018 19:33:35 -0500
Message-Id: <20181121003338.16956-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Add tests for HPD short storm detection
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

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCkFkZHMgc29tZSB0ZXN0cyBmb3Ig
SFBEIHNob3J0IHN0b3JtIGRldGVjdGlvbiwgYWxvbmcgd2l0aCBzb21lIGZpeGVzCnRvIHRoZSBj
aGFtZWxpdW0gaGVscGVycyB0aGF0IGFyZSByZXF1aXJlZCB0byBtYWtlIHRoaXMgd29yay4KCkx5
dWRlIFBhdWwgKDMpOgogIGxpYi9rbXNfY2hhbWVsaXVtOiBVc2UgRmlyZUhwZFB1bHNlIGZvciBj
aGFtZWxpdW1faHBkX3NlbmRfcHVsc2VzKCkKICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiBJbmNyZWFz
ZSBIUEQgc3Rvcm0gdGhyZXNob2xkIHRvIDEwIGZyb20gMQogIHRlc3RzL2ttc19jaGFtZWxpdW06
IEludHJvZHVjZSBIUEQgc2hvcnQgc3Rvcm0gdGVzdHMKCiBsaWIvaWd0X2NoYW1lbGl1bS5jICAg
fCAzOSArKysrKysrKysrLS0tLS0tLS0tCiBsaWIvaWd0X2NoYW1lbGl1bS5oICAgfCAgMiArLQog
bGliL2lndF9kZWJ1Z2ZzLmMgICAgIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogbGliL2lndF9kZWJ1Z2ZzLmggICAgIHwgIDQgKysKIHRlc3RzL2ttc19j
aGFtZWxpdW0uYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKy0tCiA1IGZpbGVzIGNoYW5n
ZWQsIDE2NCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
