Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6E0A6F5A1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 09:06:39 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 11 Jan 2019 10:05:26 +0100
Message-Id: <20190111090532.19235-16-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 15/21] lib/igt_chamelium: Fixup resources
 liberation in comparison helpers
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBmaXhlcyBhIGJ1bmNoIG9mIG9jY3VycmVuY2VzIG9mIG1lbW9yeSBub3QgYmVpbmcgcHJv
cGVybHkKbGliZXJhdGVkIGFmdGVyIGl0cyB1c2UgaW4gaGVscGVycyByZXZvbHZpbmcgYXJvdW5k
IGZyYW1lL0NSQwpjb21wYXJpc29uLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kg
PHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgotLS0KIGxpYi9pZ3RfY2hhbWVsaXVtLmMg
fCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY2hhbWVsaXVtLmMgYi9saWIvaWd0X2No
YW1lbGl1bS5jCmluZGV4IDMyYjg1OWVhYzRhNy4uMGI2YWMzN2EzZDg5IDEwMDY0NAotLS0gYS9s
aWIvaWd0X2NoYW1lbGl1bS5jCisrKyBiL2xpYi9pZ3RfY2hhbWVsaXVtLmMKQEAgLTEwNjAsOSAr
MTA2MCw5IEBAIHZvaWQgY2hhbWVsaXVtX2Fzc2VydF9jcmNfZXFfb3JfZHVtcChzdHJ1Y3QgY2hh
bWVsaXVtICpjaGFtZWxpdW0sCiAJCWZyZWUocmVmZXJlbmNlX3N1ZmZpeCk7CiAJCWZyZWUoY2Fw
dHVyZV9zdWZmaXgpOwogCi0JCWNoYW1lbGl1bV9kZXN0cm95X2ZyYW1lX2R1bXAoZnJhbWUpOwot
CisJCWNhaXJvX3N1cmZhY2VfZGVzdHJveShyZWZlcmVuY2UpOwogCQljYWlyb19zdXJmYWNlX2Rl
c3Ryb3koY2FwdHVyZSk7CisJCWNoYW1lbGl1bV9kZXN0cm95X2ZyYW1lX2R1bXAoZnJhbWUpOwog
CX0KIAogCWlndF9hc3NlcnQoZXEpOwpAQCAtMTEyMCwxMSArMTEyMCwxNCBAQCB2b2lkIGNoYW1l
bGl1bV9hc3NlcnRfYW5hbG9nX2ZyYW1lX21hdGNoX29yX2R1bXAoc3RydWN0IGNoYW1lbGl1bSAq
Y2hhbWVsaXVtLAogCiAJCWZyZWUocmVmZXJlbmNlX3N1ZmZpeCk7CiAJCWZyZWUoY2FwdHVyZV9z
dWZmaXgpOworCQlmcmVlKHJlZmVyZW5jZV9jcmMpOworCQlmcmVlKGNhcHR1cmVfY3JjKTsKIAl9
CiAKLQljYWlyb19zdXJmYWNlX2Rlc3Ryb3koY2FwdHVyZSk7Ci0KIAlpZ3RfYXNzZXJ0KG1hdGNo
KTsKKworCWNhaXJvX3N1cmZhY2VfZGVzdHJveShyZWZlcmVuY2UpOworCWNhaXJvX3N1cmZhY2Vf
ZGVzdHJveShjYXB0dXJlKTsKIH0KIAogCkBAIC0xMzIzLDYgKzEzMjYsOCBAQCBpZ3RfY3JjX3Qg
KmNoYW1lbGl1bV9jYWxjdWxhdGVfZmJfY3JjKGludCBmZCwgc3RydWN0IGlndF9mYiAqZmIpCiAK
IAljaGFtZWxpdW1fZG9fY2FsY3VsYXRlX2ZiX2NyYyhmYl9zdXJmYWNlLCByZXQpOwogCisJY2Fp
cm9fc3VyZmFjZV9kZXN0cm95KGZiX3N1cmZhY2UpOworCiAJcmV0dXJuIHJldDsKIH0KIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
