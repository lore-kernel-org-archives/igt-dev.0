Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BD06E4FB
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2018 10:11:04 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  2 Feb 2018 10:10:25 +0000
Message-Id: <20180202101025.15954-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] tools: Clear unused fields in register spec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgd2UgZmFpbCB0byBjbGVhciB0aGUgb3RoZXIgZmllbGRzIGluc2lkZSB0aGUgcmVnaXN0ZXIg
c3BlYywgdGhhdCBtYXkKYmUgbGVmdCB3aXRoIGdhcmJhZ2UgaW5zdHJ1Y3RpbmcgdXMgdG8gYWNj
ZXNzIHRoZSByZWdpc3RlciB2aWEgYW4KaW52YWxpZCBwYXRoLgoKQnVnemlsbGE6IGh0dHBzOi8v
YnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNDg5NQpGaXhlczogN2YwYmUw
ZTdkOWJlICgidG9vbHMvaW50ZWxfcmVnOiBBZGQgcmVhZGluZyBhbmQgd3JpdGluZyByZWdpc3Rl
cnMgdGhyb3VnaCBlbmdpbmUiKQpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+
CkNDOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNj
OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0b29s
cy9pbnRlbF9yZWdfc3BlYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfcmVnX3NwZWMuYyBiL3Rv
b2xzL2ludGVsX3JlZ19zcGVjLmMKaW5kZXggNTU5NGQ3MDc3Li41OGM4ZjdlNGMgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmMKKysrIGIvdG9vbHMvaW50ZWxfcmVnX3NwZWMuYwpA
QCAtMjY3LDcgKzI2Nyw3IEBAIHN0YXRpYyBzc2l6ZV90IHBhcnNlX2ZpbGUoc3RydWN0IHJlZyAq
KnJlZ3MsIHNpemVfdCAqbnJlZ3MsCiAJfQogCiAJd2hpbGUgKGdldGxpbmUoJmxpbmUsICZsaW5l
c2l6ZSwgZmlsZSkgIT0gLTEpIHsKLQkJc3RydWN0IHJlZyByZWc7CisJCXN0cnVjdCByZWcgcmVn
ID0ge307CiAKIAkJbGluZW5vKys7CiAKLS0gCjIuMTUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
